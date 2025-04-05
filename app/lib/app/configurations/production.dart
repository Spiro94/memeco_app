import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;

import '../../inside/i18n/translations.g.dart';
import '../../outside/client_providers/supabase/client_provider_configuration.dart';
import '../../outside/effect_providers/mixpanel/effect_provider_configuration.dart';
import '../../outside/theme/theme.dart';
import '../runner.dart';
import 'configuration.dart';

// TODO: update CHANGE_ME lines

void main() {
  final configuration = AppConfiguration(
    appLocale: AppLocale.en,
    logLevel: logging.Level.INFO,
    theme: OutsideThemes.lightTheme,
    deepLinkBaseUri:
        kIsWeb ? 'CHANGE_ME' : 'com.scarkov.memeco.deep://deeplink-callback',
    clientProvidersConfigurations: ClientProvidersConfigurations(
      sentry: null, // Using Crashlytics instead
      supabase: const Supabase_ClientProvider_Configuration(
        url: 'https://lkygvwgrykekbpfyvvza.supabase.co',
        anonKey:
            '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxreWd2d2dyeWtla2JwZnl2dnphIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI2OTI5MTAsImV4cCI6MjA1ODI2ODkxMH0.nMWIbDpQaWazQzhiELqL4cho4Xc8H77CThi4ptL4S_k''',
      ),
    ),
    effectProvidersConfigurations: EffectProvidersConfigurations(
      mixpanel: const Mixpanel_EffectProvider_Configuration(
        sendEvents: true,
        token: '7a8dd46fd1fbc9822861d13ed654fcfd',
        environment: 'prod',
      ),
    ),
  );

  appRunner(configuration: configuration);
}
