import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../base.dart';

class Crashalytics_ClientProvider extends ClientProvider_Base {
  Crashalytics_ClientProvider({
    required this.initialSessionId,
  });

  final String initialSessionId;

  @override
  Future<void> init() async {
    await setSessionId(sessionId: initialSessionId);
  }

  Future<void> setSessionId({required String sessionId}) async {
    await FirebaseCrashlytics.instance.setCustomKey('sessionId', sessionId);
  }

  Future<void> setUserId({required String? userId}) async {
    await FirebaseCrashlytics.instance.setUserIdentifier(userId ?? '');
  }

  Future<void> recordFlutterFatalError(
    FlutterErrorDetails details,
  ) async {
    await FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  }
}
