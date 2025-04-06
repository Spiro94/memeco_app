import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/bloc_managers/meme_vote_bloc.dart';
import '../../../../../../outside/repositories/memes/repository.dart';
import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import 'meme_card.dart';

class MemeFeed_Widget_List extends StatelessWidget {
  const MemeFeed_Widget_List({
    required this.memesWithVotes,
    super.key,
  });

  final List<Model_Meme_WithVotes> memesWithVotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: context.tokens.spacing.medium,
      ),
      itemCount: memesWithVotes.length,
      separatorBuilder: (_, __) => Gap(context.tokens.spacing.medium),
      itemBuilder: (_, index) {
        final memeWithVotes = memesWithVotes[index];
        final memeVoteBloc = MemeVoteBlocManager().getBloc(
          memeWithVotes,
          context.read<Meme_Repository>(),
        );

        return BlocProvider.value(
          value: memeVoteBloc,
          child: MemeFeed_Widget_Card(
            memeWithVotes: memesWithVotes[index],
          ),
        );
      },
    );
  }
}
