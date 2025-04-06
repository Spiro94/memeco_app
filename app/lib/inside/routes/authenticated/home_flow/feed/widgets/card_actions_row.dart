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
import '../../../../../blocs/meme_vote/bloc.dart';
import '../../../../../blocs/meme_vote/events.dart';
import '../../../../../blocs/meme_vote/state.dart';

class MemeFeed_CardActionsRow extends StatefulWidget {
  const MemeFeed_CardActionsRow({
    required this.memeWithVotes,
    super.key,
  });

  final Model_Meme_WithVotes memeWithVotes;

  @override
  State<MemeFeed_CardActionsRow> createState() =>
      _MemeFeed_CardActionsRowState();
}

class _MemeFeed_CardActionsRowState extends State<MemeFeed_CardActionsRow> {
  late final Share_Effect shareEffect;
  late final Mixpanel_Effect mixpanelEffect;

  @override
  void initState() {
    shareEffect = context.read<Share_EffectProvider>().getEffect();
    mixpanelEffect = context.read<Mixpanel_EffectProvider>().getEffect();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final meme = widget.memeWithVotes.meme;
    return BlocBuilder<MemeVote_Bloc, MemeVote_State>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              state.likes.toString(),
              style: theme.typography.sm.copyWith(
                color: theme.colorScheme.foreground,
              ),
            ),
            Gap(context.tokens.spacing.xSmall),
            FButton.icon(
              style:
                  state.isLiked ? FButtonStyle.primary : FButtonStyle.outline,
              onPress: () {
                context
                    .read<MemeVote_Bloc>()
                    .add(const MemeVote_LikeMemeEvent());
              },
              child: FIcon(
                FAssets.icons.thumbsUp,
              ),
            ),
            Gap(context.tokens.spacing.medium),
            Text(
              state.dislikes.toString(),
              style: theme.typography.sm.copyWith(
                color: theme.colorScheme.foreground,
              ),
            ),
            Gap(context.tokens.spacing.xSmall),
            FButton.icon(
              style: state.isDisliked
                  ? FButtonStyle.primary
                  : FButtonStyle.outline,
              onPress: () {
                context
                    .read<MemeVote_Bloc>()
                    .add(const MemeVote_DislikeMemeEvent());
              },
              child: FIcon(FAssets.icons.thumbsDown),
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
              child: FIcon(FAssets.icons.share2),
            ),
          ],
        );
      },
    );
  }
}
