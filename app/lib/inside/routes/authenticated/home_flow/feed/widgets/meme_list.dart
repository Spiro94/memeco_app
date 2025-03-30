import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme.dart';
import 'meme_card.dart';

class MemeFeed_Widget_List extends StatelessWidget {
  final List<Meme> memes;
  const MemeFeed_Widget_List({
    required this.memes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: context.tokens.spacing.medium,
      ),
      itemCount: memes.length,
      separatorBuilder: (_, __) => Gap(context.tokens.spacing.medium),
      itemBuilder: (_, index) => MemeFeed_Widget_Card(meme: memes[index]),
    );
  }
}
