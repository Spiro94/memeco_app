import 'package:memeco/outside/repositories/auth/repository.dart';
import 'package:memeco/outside/repositories/memes/repository.dart';
import 'package:memeco/outside/repositories/profile/repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements Auth_Repository {}

class MockMemeRepository extends Mock implements Meme_Repository {}

class MockProfileRepository extends Mock implements Profile_Repository {}
