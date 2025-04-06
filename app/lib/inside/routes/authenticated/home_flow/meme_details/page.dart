import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../outside/effect_providers/share_plus/effect.dart';
import '../../../../../outside/effect_providers/share_plus/effect_provider.dart';
import '../../../../../outside/repositories/memes/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../blocs/meme_details/bloc.dart';
import '../../../../blocs/meme_details/events.dart';
import '../../../../blocs/meme_details/state.dart';
import '../../../../cubits/meme_vote/cubit.dart';
import '../../../../util/breakpoints.dart';
import '../../../router.dart';
import '../../../widgets/scaffold.dart';

@RoutePage()
class MemeDetails_Page extends StatefulWidget {
  const MemeDetails_Page({
    @QueryParam() this.memeId,
    super.key,
  });

  final String? memeId;

  @override
  State<MemeDetails_Page> createState() => _MemeDetails_PageState();
}

class _MemeDetails_PageState extends State<MemeDetails_Page> {
  int likes = 0;
  int dislikes = 0;
  bool liked = false;
  bool disliked = false;

  late final Share_Effect shareEffect;

  @override
  void initState() {
    shareEffect = context.read<Share_EffectProvider>().getEffect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocProvider<MemeDetails_Bloc>(
      create: (context) => MemeDetails_Bloc(
        memeRepository: context.read<Meme_Repository>(),
        initialState: MemeDetails_State.initial(),
      )..add(MemeDetails_Event_Fetch(memeId: widget.memeId!)),
      child: Routes_Scaffold(
        breakpointType: InsideUtil_BreakpointType.constrained,
        scaffold: FScaffold(
          header: FHeader.nested(
            title: const Text('Meme Details'),
            prefixActions: [
              FHeaderAction.back(
                onPress: () {
                  context.router.navigate(const HomeShell_Route());
                },
              ),
            ],
          ),
          content: SafeArea(
            top: false,
            child: BlocBuilder<MemeDetails_Bloc, MemeDetails_State>(
              builder: (context, state) {
                if (state.status == MemeDetails_Status.loading) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                } else if (state.status == MemeDetails_Status.error) {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.tokens.spacing.xxxLarge,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Error loading meme'),
                        Gap(context.tokens.spacing.medium),
                        FButton(
                          onPress: () {
                            context.read<MemeDetails_Bloc>().add(
                                  MemeDetails_Event_Fetch(
                                    memeId: widget.memeId!,
                                  ),
                                );
                          },
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if ((state.status == MemeDetails_Status.loaded ||
                        state.status == MemeDetails_Status.idle) &&
                    state.memeWithVotes != null) {
                  final meme = state.memeWithVotes!.meme;
                  return Column(
                    children: [
                      Hero(
                        tag: 'meme_${meme.id}',
                        child: CachedNetworkImage(
                          imageUrl: meme.imageUrl,
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                        ),
                      ),
                      Gap(context.tokens.spacing.medium),
                      Text(
                        meme.title,
                        style: context.theme.typography.lg,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            likes.toString(),
                            style: theme.typography.sm.copyWith(
                              color: theme.colorScheme.foreground,
                            ),
                          ),
                          Gap(context.tokens.spacing.xSmall),
                          FButton.icon(
                            style: liked
                                ? FButtonStyle.primary
                                : FButtonStyle.outline,
                            onPress: () {
                              context.read<MemeVote_Cubit>().likeMeme(
                                    meme.id,
                                    shouldDelete: liked,
                                  );
                              if (liked) {
                                setState(() {
                                  likes--;
                                  liked = false;
                                });
                              } else if (disliked) {
                                setState(() {
                                  dislikes--;
                                  likes++;
                                  disliked = false;
                                  liked = true;
                                });
                              } else {
                                setState(() {
                                  likes++;
                                  liked = true;
                                });
                              }
                            },
                            child: FIcon(
                              FAssets.icons.thumbsUp,
                            ),
                          ),
                          Gap(context.tokens.spacing.medium),
                          Text(
                            dislikes.toString(),
                            style: theme.typography.sm.copyWith(
                              color: theme.colorScheme.foreground,
                            ),
                          ),
                          Gap(context.tokens.spacing.xSmall),
                          FButton.icon(
                            style: disliked
                                ? FButtonStyle.primary
                                : FButtonStyle.outline,
                            onPress: () {
                              context.read<MemeVote_Cubit>().dislikeMeme(
                                    meme.id,
                                    shouldDelete: disliked,
                                  );
                              if (disliked) {
                                setState(() {
                                  dislikes--;
                                  disliked = false;
                                });
                              } else if (liked) {
                                setState(() {
                                  likes--;
                                  dislikes++;
                                  liked = false;
                                  disliked = true;
                                });
                              } else {
                                setState(() {
                                  dislikes++;
                                  disliked = true;
                                });
                              }
                            },
                            child: FIcon(FAssets.icons.thumbsDown),
                          ),
                          const Spacer(),
                          FButton.icon(
                            onPress: () {
                              final deepLink =
                                  'com.scarkov.memeco.deep://deeplink-callback?memeId=${meme.id}';
                              shareEffect
                                  .shareText('Check out this meme: $deepLink');
                            },
                            child: FIcon(FAssets.icons.share2),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
