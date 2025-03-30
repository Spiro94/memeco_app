import 'package:memeco/outside/repositories/auth/repository.dart';
import 'package:memeco/outside/repositories/posts/repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements Auth_Repository {}

class MockMemeRepository extends Mock implements Meme_Repository {}
