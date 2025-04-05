import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/theme/theme.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import '../../../../../cubits/meme_vote/cubit.dart';
import '../../../../router.dart';

class MemeFeed_Widget_Card extends StatefulWidget {
  const MemeFeed_Widget_Card({
    required this.memeWithVotes,
    super.key,
  });

  final Model_Meme_WithVotes memeWithVotes;

  @override
  State<MemeFeed_Widget_Card> createState() => _MemeFeed_Widget_CardState();
}

class _MemeFeed_Widget_CardState extends State<MemeFeed_Widget_Card> {
  int likes = 0;
  int dislikes = 0;
  bool liked = false;
  bool disliked = false;

  @override
  void initState() {
    likes = widget.memeWithVotes.likes;
    dislikes = widget.memeWithVotes.dislikes;
    liked = widget.memeWithVotes.myVote ?? false;
    disliked = widget.memeWithVotes.myVote == false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final meme = widget.memeWithVotes.meme;
    return GestureDetector(
      onTap: () {
        context.router.navigate(
          MemeDetails_Route(memeId: meme.id),
        );
      },
      child: FCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  style: liked ? FButtonStyle.primary : FButtonStyle.outline,
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
                  style: disliked ? FButtonStyle.primary : FButtonStyle.outline,
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
                  onPress: () {},
                  child: FIcon(FAssets.icons.share2),
                ),
              ],
            ),
          ],
        ),
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
