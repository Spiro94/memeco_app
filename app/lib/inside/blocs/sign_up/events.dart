abstract class SignUp_Event {}

class SignUp_Event_SignUp extends SignUp_Event {
  SignUp_Event_SignUp({
    required this.email,
    required this.password,
    required this.username,
  });

  final String email;
  final String password;
  final String username;
}

class SignUp_Event_ResendEmailVerificationLink extends SignUp_Event {
  SignUp_Event_ResendEmailVerificationLink({
    required this.email,
  });

  final String email;
}
