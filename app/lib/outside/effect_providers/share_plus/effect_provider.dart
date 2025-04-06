import '../base.dart';
import 'effect.dart';

class Share_EffectProvider extends EffectProvider_Base<Share_Effect> {
  @override
  Share_Effect getEffect() {
    return const Share_Effect();
  }

  @override
  Future<void> init() async {
    // No initialization needed for share_plus
  }
}
