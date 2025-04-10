import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../outside/repositories/profile/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../blocs/auth/bloc.dart';
import '../../../../blocs/auth/events.dart';
import '../../../../cubits/user_meme_stats/cubit.dart';
import '../../../../cubits/user_meme_stats/state.dart';
import '../../../../cubits/user_profile/cubit.dart';
import '../../../../cubits/user_uploaded_memes/cubit.dart';
import '../../../../cubits/user_uploaded_memes/state.dart';
import '../../../../i18n/translations.g.dart';
import 'widgets/meme_upload_status_listener.dart';

@RoutePage()
class UserProfile_Page extends StatefulWidget {
  const UserProfile_Page({super.key});

  @override
  State<UserProfile_Page> createState() => _UserProfile_PageState();
}

class _UserProfile_PageState extends State<UserProfile_Page>
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
    final profile = context.watch<UserProfile_Cubit>().state.profile;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserUploadedMemes_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UserUploadedMemes_State.initial(),
          )..fetchUploadedMemes(userId: profile!.id),
        ),
        BlocProvider(
          create: (context) => UserMemeStats_Cubit(
            profileRepository: context.read<Profile_Repository>(),
            initialState: UserMemeStats_State.initial(),
          )..fetchMemeStats(userId: profile!.id),
        ),
      ],
      child: FScaffold(
        header: FHeader(
          title: Text(context.t.profile.title),
          actions: [
            FPopoverMenu(
              popoverController: controller,
              menuAnchor: Alignment.topRight,
              childAnchor: Alignment.bottomRight,
              menu: [
                FTileGroup(
                  children: [
                    FTile(
                      prefixIcon: FIcon(FAssets.icons.user),
                      title: Text(context.t.profile.actions.editProfile.label),
                      onPress: () {},
                    ),
                  ],
                ),
                FTileGroup(
                  children: [
                    FTile(
                      prefixIcon: FIcon(FAssets.icons.logOut),
                      title: Text(context.t.profile.actions.signOut.label),
                      onPress: () {
                        context.read<Auth_Bloc>().add(Auth_Event_SignOut());
                      },
                    ),
                  ],
                ),
              ],
              child: FHeaderAction(
                icon: FIcon(FAssets.icons.ellipsis),
                onPress: controller.toggle,
              ),
            ),
          ],
        ),
        content: Profile_Listener_MemeUpload(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FAvatar(
                  image: const NetworkImage(''),
                  fallback: Text(
                    profile?.username[0].toUpperCase() ?? '',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  size: 80,
                ),
                Gap(context.tokens.spacing.medium),
                Text(
                  profile?.username ?? '',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(context.tokens.spacing.medium),
                BlocBuilder<UserMemeStats_Cubit, UserMemeStats_State>(
                  builder: (context, state) {
                    if (state.status == UserMemeStats_Status.loading) {
                      return const CircularProgressIndicator();
                    } else if (state.status == UserMemeStats_Status.error) {
                      return const Text('Error loading your stats');
                    } else if (state.status == UserMemeStats_Status.loaded) {
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
                BlocBuilder<UserUploadedMemes_Cubit, UserUploadedMemes_State>(
                  builder: (context, state) {
                    if (state.status == UserUploadedMemes_Status.loading) {
                      return const CircularProgressIndicator();
                    } else if (state.status == UserUploadedMemes_Status.error) {
                      return const Text('Error loading your memes');
                    } else if (state.status ==
                        UserUploadedMemes_Status.loaded) {
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
    );
  }
}
