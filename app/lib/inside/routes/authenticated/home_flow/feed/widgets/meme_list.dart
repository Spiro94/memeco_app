import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/repositories/memes/repository.dart';
import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import '../../../../../cubits/meme_vote/cubit.dart';
import '../../../../../cubits/meme_vote/state.dart';
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
      itemBuilder: (_, index) => BlocProvider(
        create: (context) {
          return MemeVote_Cubit(
            initialState: MemeVote_State.initial(),
            memeRepository: context.read<Meme_Repository>(),
          );
        },
        child: MemeFeed_Widget_Card(
          memeWithVotes: memesWithVotes[index],
        ),
      ),
    );
  }
}
