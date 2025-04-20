import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/bloc_managers/meme_vote_bloc.dart';
import '../../../../../../outside/repositories/memes/repository.dart';
import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import '../../../../../blocs/memes/bloc.dart';
import '../../../../../blocs/memes/events.dart';
import 'meme_card.dart';

class MemeFeed_Widget_List extends StatefulWidget {
  const MemeFeed_Widget_List({
    required this.memesWithVotes,
    super.key,
  });

  final List<Model_Meme_WithVotes> memesWithVotes;

  @override
  State<MemeFeed_Widget_List> createState() => _MemeFeed_Widget_ListState();
}

class _MemeFeed_Widget_ListState extends State<MemeFeed_Widget_List> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final feedBloc = context.read<MemeFeed_Bloc>();

    // Don’t spam events once we’ve reached the end
    if (feedBloc.state.cursor == null) return;

    // When there are < 300 px left to scroll, fetch the next page
    if (_scrollController.position.extentAfter < 300) {
      feedBloc.add(const MemeFeed_Event_FetchNextPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        vertical: tokens.spacing.medium,
      ),
      itemCount: widget.memesWithVotes.length,
      separatorBuilder: (_, __) => Gap(tokens.spacing.medium),
      itemBuilder: (_, index) {
        final memeWithVotes = widget.memesWithVotes[index];
        final memeVoteBloc = MemeVoteBlocManager().getBloc(
          memeWithVotes,
          context.read<Meme_Repository>(),
        );

        return BlocProvider.value(
          value: memeVoteBloc,
          child: MemeFeed_Widget_Card(memeWithVotes: memeWithVotes),
        );
      },
    );
  }
}
