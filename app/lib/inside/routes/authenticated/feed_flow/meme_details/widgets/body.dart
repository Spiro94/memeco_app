import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import 'card_actions_row.dart';

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
