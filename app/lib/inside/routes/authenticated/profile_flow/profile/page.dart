import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../outside/repositories/profile/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../cubits/meme_stats/cubit.dart';
import '../../../../cubits/meme_stats/state.dart';
import '../../../../cubits/profile/cubit.dart';
import '../../../../cubits/profile/state.dart';
import '../../../../cubits/uploaded_memes/cubit.dart';
import '../../../../cubits/uploaded_memes/state.dart';
import '../../../../i18n/translations.g.dart';
import '../../../../util/breakpoints.dart';
import '../../../router.dart';
import '../../../widgets/scaffold.dart';

@RoutePage()
class Profile_Page extends StatefulWidget {
  const Profile_Page({
    @PathParam() required this.userId,
    super.key,
  });

  final String userId;

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
    with SingleTickerProviderStateMixin {
  late final FPopoverController controller;

  @override
  void initState() {
    super.initState();
    controller = FPopoverController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UploadedMemes_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UploadedMemes_State.initial(),
          )..fetchUploadedMemes(userId: widget.userId),
        ),
        BlocProvider(
          create: (context) => MemeStats_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: MemeStats_State.initial(),
          )..fetchMemeStats(userId: widget.userId),
        ),
        BlocProvider(
          create: (context) => Profile_Cubit(
            profileRepository: context.read<Profile_Repository>(),
          )..fetchProfile(userId: widget.userId),
        ),
      ],
      child: Routes_Scaffold(
        breakpointType: InsideUtil_BreakpointType.constrained,
        scaffold: FScaffold(
          header: FHeader.nested(
            prefixActions: [
              FHeaderAction.back(
                onPress: () {
                  context.router.navigate(const HomeShell_Route());
                },
              ),
            ],
            title: Text(context.t.profile.title),
          ),
          content: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<Profile_Cubit, Profile_State>(
                    builder: (context, state) {
                      if (state.status == Profile_Status.loading) {
                        return const CircularProgressIndicator();
                      } else if (state.status == Profile_Status.failure) {
                        return const Text('Error loading your profile');
                      } else if (state.status == Profile_Status.loaded) {
                        return Column(
                          children: [
                            FAvatar(
                              image: const NetworkImage(''),
                              fallback: Text(
                                state.profile!.username[0].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              size: 80,
                            ),
                            Gap(context.tokens.spacing.medium),
                            Text(
                              state.profile!.username,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Gap(context.tokens.spacing.medium),
                  BlocBuilder<MemeStats_Cubit, MemeStats_State>(
                    builder: (context, state) {
                      if (state.status == MemeStats_Status.loading) {
                        return const CircularProgressIndicator();
                      } else if (state.status == MemeStats_Status.error) {
                        return const Text('Error loading your stats');
                      } else if (state.status == MemeStats_Status.loaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Your Stats',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gap(context.tokens.spacing.medium),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      state.memeStats.likesGiven.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text('Likes'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      state.memeStats.memesPosted.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text('Memes Created'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const FDivider(),
                  BlocBuilder<UploadedMemes_Cubit, UploadedMemes_State>(
                    builder: (context, state) {
                      if (state.status == UploadedMemes_Status.loading) {
                        return const CircularProgressIndicator();
                      } else if (state.status == UploadedMemes_Status.error) {
                        return const Text('Error loading your memes');
                      } else if (state.status == UploadedMemes_Status.loaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Uploaded Memes',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                vertical: context.tokens.spacing.medium,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                              ),
                              itemCount: state.memes.length,
                              itemBuilder: (context, index) {
                                final meme = state.memes[index];
                                return CachedNetworkImage(
                                  imageUrl: meme.imageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
