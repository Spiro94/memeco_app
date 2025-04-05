import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../outside/repositories/memes/repository.dart';
import '../../../../../outside/theme/theme.dart';
import '../../../../blocs/meme_details/bloc.dart';
import '../../../../blocs/meme_details/events.dart';
import '../../../../blocs/meme_details/state.dart';
import '../../../../util/breakpoints.dart';
import '../../../router.dart';
import '../../../widgets/scaffold.dart';

@RoutePage()
class MemeDetails_Page extends StatelessWidget implements AutoRouteWrapper {
  const MemeDetails_Page({
    @QueryParam() this.memeId,
    super.key,
  });

  final String? memeId;

  @override
  Widget wrappedRoute(BuildContext context) {
    if (memeId == null) {
      return const Text('No Meme ID provided');
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
        content: SingleChildScrollView(
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.errorMessage}'),
                    ],
                  ),
                );
              } else if ((state.status == MemeDetails_Status.loaded ||
                      state.status == MemeDetails_Status.idle) &&
                  state.memeWithVotes != null) {
                final meme = state.memeWithVotes!.meme;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'meme_${meme.id}',
                        child: CachedNetworkImage(
                          imageUrl: meme.imageUrl,
                          width: double.infinity,
                        ),
                      ),
                      Gap(context.tokens.spacing.medium),
                      Text(
                        meme.title,
                        style: context.theme.typography.lg,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
