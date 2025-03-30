import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme.dart';

class MemeFeed_Widget_Card extends StatelessWidget {
  const MemeFeed_Widget_Card({
    required this.meme,
    super.key,
  });

  final Meme meme;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return FCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: meme.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.fitHeight,
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
