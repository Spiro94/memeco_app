import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:gap/gap.dart';

import '../../../../../../outside/effect_providers/mixpanel/effect.dart';
import '../../../../../../outside/effect_providers/mixpanel/effect_provider.dart';
import '../../../../../../outside/effect_providers/share_plus/effect.dart';
import '../../../../../../outside/effect_providers/share_plus/effect_provider.dart';
import '../../../../../../outside/theme/theme.dart';
import '../../../../../../outside/utils/deep_link.dart';
import '../../../../../../shared/models/meme_with_votes.dart';
import '../../../../../cubits/meme_vote/cubit.dart';

class MemeDetails_CardActionsRow extends StatefulWidget {
  const MemeDetails_CardActionsRow({
    required this.memeWithVotes,
    super.key,
  });

  final Model_Meme_WithVotes memeWithVotes;

  @override
  State<MemeDetails_CardActionsRow> createState() =>
      _MemeDetails_CardActionsRowState();
}

class _MemeDetails_CardActionsRowState
    extends State<MemeDetails_CardActionsRow> {
  int likes = 0;
  int dislikes = 0;
  bool liked = false;
  bool disliked = false;

  late final Share_Effect shareEffect;
  late final Mixpanel_Effect mixpanelEffect;

  @override
  void initState() {
    likes = widget.memeWithVotes.likes;
    dislikes = widget.memeWithVotes.dislikes;
    liked = widget.memeWithVotes.myVote ?? false;
    disliked = widget.memeWithVotes.myVote == false;

    shareEffect = context.read<Share_EffectProvider>().getEffect();
    mixpanelEffect = context.read<Mixpanel_EffectProvider>().getEffect();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final meme = widget.memeWithVotes.meme;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.tokens.spacing.xSmall,
        horizontal: context.tokens.spacing.small,
      ),
      child: Row(
        children: [
          Text(
            likes.toString(),
            style: theme.typography.xl2,
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
              size: context.tokens.iconSize.large,
            ),
          ),
          Gap(context.tokens.spacing.large),
          Text(
            dislikes.toString(),
            style: theme.typography.xl2,
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
            child: FIcon(
              FAssets.icons.thumbsDown,
              size: context.tokens.iconSize.large,
            ),
          ),
          const Spacer(),
          FButton.icon(
            onPress: () {
              final deepLink = DeepLinkUtils.memeDetailsUrl(meme.id);
              shareEffect.shareText(
                'Check out this meme: $deepLink',
              );
              mixpanelEffect.trackEvent(
                event: 'share_meme',
                properties: {
                  'meme_id': meme.id,
                  'meme_title': meme.title,
                },
              );
            },
            child: FIcon(
              FAssets.icons.share2,
              size: context.tokens.iconSize.large,
            ),
          ),
        ],
      ),
    );
  }
}
