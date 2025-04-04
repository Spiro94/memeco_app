import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/repository.dart';
import 'base.dart';
import 'memes/repository.dart';
import 'profile/repository.dart';

/// When adding a new repository, be sure to add it to:
/// - [getList]
/// - [createProviders]
///   - Make sure to add the concrete type to `RepositoryProvider<ConcreteType>`
///     otherwise it will register the base class.
class Repositories_All {
  const Repositories_All({
    required this.authRepository,
    required this.memeRepository,
    required this.profileRepository,
  });

  final Auth_Repository authRepository;
  final Meme_Repository memeRepository;
  final Profile_Repository profileRepository;

  List<Repository_Base> getList() => [
        authRepository,
      ];

  List<RepositoryProvider<Repository_Base>> createProviders() {
    return [
      RepositoryProvider<Auth_Repository>.value(value: authRepository),
      RepositoryProvider<Meme_Repository>.value(value: memeRepository),
      RepositoryProvider<Profile_Repository>.value(value: profileRepository),
    ];
  }

  Future<void> initialize() async {
    await Future.forEach(getList(), (r) async {
      r.log.fine('init');
      await r.init();
    });
  }
}
