import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import '../../../../router.dart';
import 'card_actions_row.dart';

class MemeFeed_Widget_Card extends StatelessWidget {
  const MemeFeed_Widget_Card({
    required this.memeWithVotes,
    super.key,
  });

  final Model_Meme_WithVotes memeWithVotes;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final meme = memeWithVotes.meme;
    return FCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.router.navigate(
                Profile_Route(
                  userId: memeWithVotes.creatorId!,
                ),
              );
            },
            child: Row(
              children: [
                FAvatar(
                  image:
                      NetworkImage(memeWithVotes.creatorProfilePicture ?? ''),
                  fallback: Text(
                    memeWithVotes.creatorUsername![0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  size: 30,
                ),
                Gap(context.tokens.spacing.xxSmall),
                Text(memeWithVotes.creatorUsername!),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.router.navigate(
                MemeDetails_Route(
                  memeId: meme.id,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(context.tokens.spacing.medium),
                Hero(
                  tag: 'meme_${meme.id}',
                  child: CachedNetworkImage(
                    imageUrl: meme.imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Gap(context.tokens.spacing.medium),
                Text(
                  meme.title,
                  style: theme.typography.base.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.foreground,
                    height: 1.5,
                  ),
                ),
                Gap(context.tokens.spacing.xxSmall),
                Text(
                  formatDate(meme.createdAt),
                  style: theme.typography.sm
                      .copyWith(color: theme.colorScheme.mutedForeground),
                ),
                const FDivider(),
                MemeFeed_CardActionsRow(memeWithVotes: memeWithVotes),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) {
      return 'Publicado hace ${diff.inDays} '
          'día${diff.inDays == 1 ? '' : 's'}';
    } else if (diff.inHours >= 1) {
      return 'Publicado hace ${diff.inHours} '
          'hora${diff.inHours == 1 ? '' : 's'}';
    } else if (diff.inMinutes >= 1) {
      return 'Publicado hace ${diff.inMinutes} '
          'minuto${diff.inMinutes == 1 ? '' : 's'}';
    }
    return 'Publicado hace un momento';
  }
}
