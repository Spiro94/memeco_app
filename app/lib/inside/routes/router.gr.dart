// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [Authenticated_Router]
class Authenticated_Routes extends PageRouteInfo<void> {
  const Authenticated_Routes({List<PageRouteInfo>? children})
    : super(Authenticated_Routes.name, initialChildren: children);

  static const String name = 'Authenticated_Routes';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Authenticated_Router();
    },
  );
}

/// generated route for
/// [EmailVerificationLinkSent_Page]
class EmailVerificationLinkSent_Route extends PageRouteInfo<void> {
  const EmailVerificationLinkSent_Route({List<PageRouteInfo>? children})
    : super(EmailVerificationLinkSent_Route.name, initialChildren: children);

  static const String name = 'EmailVerificationLinkSent_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const EmailVerificationLinkSent_Page());
    },
  );
}

/// generated route for
/// [ForgotPasswordFlow_Router]
class ForgotPasswordFlow_Routes extends PageRouteInfo<void> {
  const ForgotPasswordFlow_Routes({List<PageRouteInfo>? children})
    : super(ForgotPasswordFlow_Routes.name, initialChildren: children);

  static const String name = 'ForgotPasswordFlow_Routes';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordFlow_Router();
    },
  );
}

/// generated route for
/// [ForgotPassword_Page]
class ForgotPassword_Route extends PageRouteInfo<void> {
  const ForgotPassword_Route({List<PageRouteInfo>? children})
    : super(ForgotPassword_Route.name, initialChildren: children);

  static const String name = 'ForgotPassword_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ForgotPassword_Page());
    },
  );
}

/// generated route for
/// [HomeFeed_Page]
class HomeFeed_Route extends PageRouteInfo<void> {
  const HomeFeed_Route({List<PageRouteInfo>? children})
    : super(HomeFeed_Route.name, initialChildren: children);

  static const String name = 'HomeFeed_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeFeed_Page();
    },
  );
}

/// generated route for
/// [HomeShell_Page]
class HomeShell_Route extends PageRouteInfo<void> {
  const HomeShell_Route({List<PageRouteInfo>? children})
    : super(HomeShell_Route.name, initialChildren: children);

  static const String name = 'HomeShell_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const HomeShell_Page());
    },
  );
}

/// generated route for
/// [MemeDetails_Page]
class MemeDetails_Route extends PageRouteInfo<MemeDetails_RouteArgs> {
  MemeDetails_Route({String? memeId, Key? key, List<PageRouteInfo>? children})
    : super(
        MemeDetails_Route.name,
        args: MemeDetails_RouteArgs(memeId: memeId, key: key),
        rawQueryParams: {'memeId': memeId},
        initialChildren: children,
      );

  static const String name = 'MemeDetails_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<MemeDetails_RouteArgs>(
        orElse:
            () =>
                MemeDetails_RouteArgs(memeId: queryParams.optString('memeId')),
      );
      return MemeDetails_Page(memeId: args.memeId, key: args.key);
    },
  );
}

class MemeDetails_RouteArgs {
  const MemeDetails_RouteArgs({this.memeId, this.key});

  final String? memeId;

  final Key? key;

  @override
  String toString() {
    return 'MemeDetails_RouteArgs{memeId: $memeId, key: $key}';
  }
}

/// generated route for
/// [Profile_Page]
class Profile_Route extends PageRouteInfo<void> {
  const Profile_Route({List<PageRouteInfo>? children})
    : super(Profile_Route.name, initialChildren: children);

  static const String name = 'Profile_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Profile_Page();
    },
  );
}

/// generated route for
/// [ResetPasswordLinkSent_Page]
class ResetPasswordLinkSent_Route
    extends PageRouteInfo<ResetPasswordLinkSent_RouteArgs> {
  ResetPasswordLinkSent_Route({
    String? email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ResetPasswordLinkSent_Route.name,
         args: ResetPasswordLinkSent_RouteArgs(email: email, key: key),
         rawQueryParams: {'email': email},
         initialChildren: children,
       );

  static const String name = 'ResetPasswordLinkSent_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ResetPasswordLinkSent_RouteArgs>(
        orElse:
            () => ResetPasswordLinkSent_RouteArgs(
              email: queryParams.optString('email'),
            ),
      );
      return WrappedRoute(
        child: ResetPasswordLinkSent_Page(email: args.email, key: args.key),
      );
    },
  );
}

class ResetPasswordLinkSent_RouteArgs {
  const ResetPasswordLinkSent_RouteArgs({this.email, this.key});

  final String? email;

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordLinkSent_RouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [ResetPassword_Page]
class ResetPassword_Route extends PageRouteInfo<void> {
  const ResetPassword_Route({List<PageRouteInfo>? children})
    : super(ResetPassword_Route.name, initialChildren: children);

  static const String name = 'ResetPassword_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ResetPassword_Page());
    },
  );
}

/// generated route for
/// [SignIn_Page]
class SignIn_Route extends PageRouteInfo<void> {
  const SignIn_Route({List<PageRouteInfo>? children})
    : super(SignIn_Route.name, initialChildren: children);

  static const String name = 'SignIn_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignIn_Page());
    },
  );
}

/// generated route for
/// [SignUp_Page]
class SignUp_Route extends PageRouteInfo<void> {
  const SignUp_Route({List<PageRouteInfo>? children})
    : super(SignUp_Route.name, initialChildren: children);

  static const String name = 'SignUp_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignUp_Page());
    },
  );
}

/// generated route for
/// [Unauthenticated_Router]
class Unauthenticated_Routes extends PageRouteInfo<void> {
  const Unauthenticated_Routes({List<PageRouteInfo>? children})
    : super(Unauthenticated_Routes.name, initialChildren: children);

  static const String name = 'Unauthenticated_Routes';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Unauthenticated_Router();
    },
  );
}

/// generated route for
/// [UploadMeme_Page]
class UploadMeme_Route extends PageRouteInfo<void> {
  const UploadMeme_Route({List<PageRouteInfo>? children})
    : super(UploadMeme_Route.name, initialChildren: children);

  static const String name = 'UploadMeme_Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UploadMeme_Page();
    },
  );
}
