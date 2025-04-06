import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_change/effect_provider.dart';
import 'base.dart';
import 'mixpanel/effect_provider.dart';
import 'share_plus/effect_provider.dart';

/// When adding a new effect provider, be sure to add it to:
/// - [getList]
/// - [createProviders]
///   - Make sure to add the concrete type to `RepositoryProvider<ConcreteType>`
///     otherwise it will register the base class.
class EffectProviders_All {
  const EffectProviders_All({
    required this.authChangeEffectProvider,
    required this.mixpanelEffectProvider,
    required this.shareEffectProvider,
  });

  final AuthChange_EffectProvider authChangeEffectProvider;
  final Mixpanel_EffectProvider mixpanelEffectProvider;
  final Share_EffectProvider shareEffectProvider;

  List<EffectProvider_Base<dynamic>> getList() => [
        authChangeEffectProvider,
        mixpanelEffectProvider,
        shareEffectProvider,
      ];

  List<RepositoryProvider<EffectProvider_Base<dynamic>>> createProviders() {
    return [
      RepositoryProvider<AuthChange_EffectProvider>.value(
        value: authChangeEffectProvider,
      ),
      RepositoryProvider<Mixpanel_EffectProvider>.value(
        value: mixpanelEffectProvider,
      ),
      RepositoryProvider<Share_EffectProvider>.value(
        value: shareEffectProvider,
      ),
    ];
  }

  Future<void> initialize() async {
    await Future.forEach(getList(), (r) async {
      r.log.fine('init');
      await r.init();
    });
  }
}
