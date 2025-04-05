import 'base.dart';
import 'firebase_crashalytics/client_provider.dart';
import 'sentry/client_provider.dart';
import 'supabase/client_provider.dart';

/// When adding a new client provider, be sure to add it to:
/// - [getList]
class ClientProviders_All {
  ClientProviders_All({
    required this.sentryClientProvider,
    required this.crashalyticsClientProvider,
    required this.supabaseClientProvider,
  });

  final Sentry_ClientProvider sentryClientProvider;
  final Supabase_ClientProvider supabaseClientProvider;
  final Crashalytics_ClientProvider crashalyticsClientProvider;

  List<ClientProvider_Base> getList() => [
        sentryClientProvider,
        supabaseClientProvider,
        crashalyticsClientProvider,
      ];

  Future<void> initialize() async {
    await Future.forEach(getList(), (r) async {
      r.log.fine('init');
      await r.init();
    });
  }
}
