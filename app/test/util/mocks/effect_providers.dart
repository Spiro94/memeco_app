import 'package:memeco/outside/effect_providers/auth_change/effect_provider.dart';
import 'package:memeco/outside/effect_providers/mixpanel/effect_provider.dart';
import 'package:memeco/outside/effect_providers/share_plus/effect_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthChangeEffectProvider extends Mock
    implements AuthChange_EffectProvider {}

class MockMixpanelEffectProvider extends Mock
    implements Mixpanel_EffectProvider {}

class MockShareEffectProvider extends Mock implements Share_EffectProvider {}
