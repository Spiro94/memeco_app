import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../outside/bloc_managers/meme_vote_bloc.dart';
import '../../../../../outside/repositories/memes/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../../shared/models/meme_with_votes.dart';
import '../../../../blocs/meme_details/bloc.dart';
import '../../../../blocs/meme_details/events.dart';
import '../../../../blocs/meme_details/state.dart';
import '../../../../util/breakpoints.dart';
import '../../../router.dart';
import '../../../widgets/scaffold.dart';
import 'widgets/card_actions_row.dart';

@RoutePage()
class MemeDetails_Page extends StatelessWidget implements AutoRouteWrapper {
  const MemeDetails_Page({
    @PathParam() this.memeId,
    super.key,
  });

  final String? memeId;

  @override
  Widget wrappedRoute(BuildContext context) {
    if (memeId == null) {
      return const FScaffold(
        content: Center(
          child: Text('No meme id provided'),
        ),
      );
    } else {
      return BlocProvider<MemeDetails_Bloc>(
        create: (context) => MemeDetails_Bloc(
          memeRepository: context.read<Meme_Repository>(),
          initialState: MemeDetails_State.initial(),
        )..add(MemeDetails_Event_Fetch(memeId: memeId!)),
        child: this,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Routes_Scaffold(
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
              final memeWithVotes = state.memeWithVotes;
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
                                  memeId: memeId!,
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
                // Check if the memeVoteBloc is provided
                // If it is, use it to provide the
                // MemeVote_Bloc to the MemeDetails_Body
                // If not, create a new one (deeplink case)

                final memeVoteBloc = MemeVoteBlocManager().getBloc(
                  memeWithVotes!,
                  context.read<Meme_Repository>(),
                );

                return BlocProvider.value(
                  value: memeVoteBloc,
                  child: MemeDetails_Body(
                    memeWithVotes: memeWithVotes,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class MemeDetails_Body extends StatelessWidget {
  const MemeDetails_Body({
    required this.memeWithVotes,
    super.key,
  });

  final Model_Meme_WithVotes memeWithVotes;

  @override
  Widget build(BuildContext context) {
    final meme = memeWithVotes.meme;
    return Column(
      children: [
        Expanded(
          child: Hero(
            tag: 'meme_${meme.id}',
            child: CachedNetworkImage(
              imageUrl: meme.imageUrl,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
          ),
        ),
        Gap(context.tokens.spacing.medium),
        Text(
          meme.title,
          style: context.theme.typography.xl,
          textAlign: TextAlign.center,
        ),
        const FDivider(),
        MemeDetails_CardActionsRow(
          memeWithVotes: memeWithVotes,
        ),
      ],
    );
  }
}
