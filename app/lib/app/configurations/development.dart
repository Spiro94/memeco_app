import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;

import '../../inside/i18n/translations.g.dart';
import '../../outside/client_providers/supabase/client_provider_configuration.dart';
import '../../outside/effect_providers/mixpanel/effect_provider_configuration.dart';
import '../../outside/theme/theme.dart';
import '../runner.dart';
import 'configuration.dart';

void main() {
  const siteHost = String.fromEnvironment('SITE_HOST');

  log('siteHost: $siteHost');

  final configuration = AppConfiguration(
    appLocale: AppLocale.en,
    logLevel: logging.Level.ALL,
    theme: OutsideThemes.lightTheme,
    deepLinkBaseUri: kIsWeb
        ? 'http://$siteHost:3000'
        : 'com.scarkov.memeco.deep://deeplink-callback',
    clientProvidersConfigurations: ClientProvidersConfigurations(
      sentry: null,
      supabase: const Supabase_ClientProvider_Configuration(
        url: 'http://$siteHost:8001',
        anonKey:
            '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0''',
      ),
    ),
    effectProvidersConfigurations: EffectProvidersConfigurations(
      mixpanel: const Mixpanel_EffectProvider_Configuration(
        sendEvents: true,
        token: '8653ec4afb87513181227e5fdcfcbc2c',
        environment: 'dev',
      ),
    ),
  );

  appRunner(configuration: configuration);
}
