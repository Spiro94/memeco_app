///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsEmailVerificationLinkSentEn emailVerificationLinkSent = TranslationsEmailVerificationLinkSentEn._(_root);
	late final TranslationsForgotPasswordEn forgotPassword = TranslationsForgotPasswordEn._(_root);
	late final TranslationsHomeShellEn homeShell = TranslationsHomeShellEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsResetPasswordLinkSentEn resetPasswordLinkSent = TranslationsResetPasswordLinkSentEn._(_root);
	late final TranslationsResetPasswordEn resetPassword = TranslationsResetPasswordEn._(_root);
	late final TranslationsSignInEn signIn = TranslationsSignInEn._(_root);
	late final TranslationsSignUpEn signUp = TranslationsSignUpEn._(_root);
}

// Path: emailVerificationLinkSent
class TranslationsEmailVerificationLinkSentEn {
	TranslationsEmailVerificationLinkSentEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Email Verification Link Sent';
	String get subtitle => 'Check your email for you email verification link.';
}

// Path: forgotPassword
class TranslationsForgotPasswordEn {
	TranslationsForgotPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Forgot Password?';
	late final TranslationsForgotPasswordFormEn form = TranslationsForgotPasswordFormEn._(_root);
}

// Path: homeShell
class TranslationsHomeShellEn {
	TranslationsHomeShellEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomeShellNavigationBarEn navigationBar = TranslationsHomeShellNavigationBarEn._(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Memeco';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
	late final TranslationsProfileActionsEn actions = TranslationsProfileActionsEn._(_root);
}

// Path: resetPasswordLinkSent
class TranslationsResetPasswordLinkSentEn {
	TranslationsResetPasswordLinkSentEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reset Password Link';
	String get subtitle => 'Check your email for your reset password link.';
	late final TranslationsResetPasswordLinkSentResendEn resend = TranslationsResetPasswordLinkSentResendEn._(_root);
}

// Path: resetPassword
class TranslationsResetPasswordEn {
	TranslationsResetPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reset Password';
	late final TranslationsResetPasswordFormEn form = TranslationsResetPasswordFormEn._(_root);
}

// Path: signIn
class TranslationsSignInEn {
	TranslationsSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign In';
	late final TranslationsSignInSignUpEn signUp = TranslationsSignInSignUpEn._(_root);
	late final TranslationsSignInForgotPasswordEn forgotPassword = TranslationsSignInForgotPasswordEn._(_root);
	late final TranslationsSignInFormEn form = TranslationsSignInFormEn._(_root);
}

// Path: signUp
class TranslationsSignUpEn {
	TranslationsSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign Up';
	late final TranslationsSignUpFormEn form = TranslationsSignUpFormEn._(_root);
	late final TranslationsSignUpResendEmailVerificationEn resendEmailVerification = TranslationsSignUpResendEmailVerificationEn._(_root);
}

// Path: forgotPassword.form
class TranslationsForgotPasswordFormEn {
	TranslationsForgotPasswordFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsForgotPasswordFormEmailEn email = TranslationsForgotPasswordFormEmailEn._(_root);
	late final TranslationsForgotPasswordFormSubmitEn submit = TranslationsForgotPasswordFormSubmitEn._(_root);
}

// Path: homeShell.navigationBar
class TranslationsHomeShellNavigationBarEn {
	TranslationsHomeShellNavigationBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomeShellNavigationBarHomeEn home = TranslationsHomeShellNavigationBarHomeEn._(_root);
	late final TranslationsHomeShellNavigationBarProfileEn profile = TranslationsHomeShellNavigationBarProfileEn._(_root);
}

// Path: profile.actions
class TranslationsProfileActionsEn {
	TranslationsProfileActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsProfileActionsSignOutEn signOut = TranslationsProfileActionsSignOutEn._(_root);
	late final TranslationsProfileActionsEditProfileEn editProfile = TranslationsProfileActionsEditProfileEn._(_root);
	late final TranslationsProfileActionsDeleteAccountEn deleteAccount = TranslationsProfileActionsDeleteAccountEn._(_root);
}

// Path: resetPasswordLinkSent.resend
class TranslationsResetPasswordLinkSentResendEn {
	TranslationsResetPasswordLinkSentResendEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question => 'Didn\'t receive a link?';
	String get action => 'Resend';
	String get success => 'Your reset password link was resent.';
}

// Path: resetPassword.form
class TranslationsResetPasswordFormEn {
	TranslationsResetPasswordFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsResetPasswordFormPasswordEn password = TranslationsResetPasswordFormPasswordEn._(_root);
	late final TranslationsResetPasswordFormSubmitEn submit = TranslationsResetPasswordFormSubmitEn._(_root);
}

// Path: signIn.signUp
class TranslationsSignInSignUpEn {
	TranslationsSignInSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question => 'Need an account?';
	String get action => 'Sign Up';
}

// Path: signIn.forgotPassword
class TranslationsSignInForgotPasswordEn {
	TranslationsSignInForgotPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question => 'Forgot password?';
}

// Path: signIn.form
class TranslationsSignInFormEn {
	TranslationsSignInFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSignInFormEmailEn email = TranslationsSignInFormEmailEn._(_root);
	late final TranslationsSignInFormPasswordEn password = TranslationsSignInFormPasswordEn._(_root);
	late final TranslationsSignInFormSubmitEn submit = TranslationsSignInFormSubmitEn._(_root);
}

// Path: signUp.form
class TranslationsSignUpFormEn {
	TranslationsSignUpFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSignUpFormUsernameEn username = TranslationsSignUpFormUsernameEn._(_root);
	late final TranslationsSignUpFormEmailEn email = TranslationsSignUpFormEmailEn._(_root);
	late final TranslationsSignUpFormPasswordEn password = TranslationsSignUpFormPasswordEn._(_root);
	late final TranslationsSignUpFormSubmitEn submit = TranslationsSignUpFormSubmitEn._(_root);
}

// Path: signUp.resendEmailVerification
class TranslationsSignUpResendEmailVerificationEn {
	TranslationsSignUpResendEmailVerificationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question => 'Still need to verify you email?';
	String get action => 'Resend';
	late final TranslationsSignUpResendEmailVerificationDialogEn dialog = TranslationsSignUpResendEmailVerificationDialogEn._(_root);
}

// Path: forgotPassword.form.email
class TranslationsForgotPasswordFormEmailEn {
	TranslationsForgotPasswordFormEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get hint => 'john.doe@example.com';
	late final TranslationsForgotPasswordFormEmailErrorEn error = TranslationsForgotPasswordFormEmailErrorEn._(_root);
}

// Path: forgotPassword.form.submit
class TranslationsForgotPasswordFormSubmitEn {
	TranslationsForgotPasswordFormSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Reset Password';
}

// Path: homeShell.navigationBar.home
class TranslationsHomeShellNavigationBarHomeEn {
	TranslationsHomeShellNavigationBarHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Home';
}

// Path: homeShell.navigationBar.profile
class TranslationsHomeShellNavigationBarProfileEn {
	TranslationsHomeShellNavigationBarProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Profile';
}

// Path: profile.actions.signOut
class TranslationsProfileActionsSignOutEn {
	TranslationsProfileActionsSignOutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Sign Out';
}

// Path: profile.actions.editProfile
class TranslationsProfileActionsEditProfileEn {
	TranslationsProfileActionsEditProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Edit Profile';
}

// Path: profile.actions.deleteAccount
class TranslationsProfileActionsDeleteAccountEn {
	TranslationsProfileActionsDeleteAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Delete Account';
	late final TranslationsProfileActionsDeleteAccountDialogEn dialog = TranslationsProfileActionsDeleteAccountDialogEn._(_root);
}

// Path: resetPassword.form.password
class TranslationsResetPasswordFormPasswordEn {
	TranslationsResetPasswordFormPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	late final TranslationsResetPasswordFormPasswordErrorEn error = TranslationsResetPasswordFormPasswordErrorEn._(_root);
}

// Path: resetPassword.form.submit
class TranslationsResetPasswordFormSubmitEn {
	TranslationsResetPasswordFormSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Reset Password';
	String get success => 'Your password was reset.';
}

// Path: signIn.form.email
class TranslationsSignInFormEmailEn {
	TranslationsSignInFormEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get hint => 'john.doe@example.com';
	late final TranslationsSignInFormEmailErrorEn error = TranslationsSignInFormEmailErrorEn._(_root);
}

// Path: signIn.form.password
class TranslationsSignInFormPasswordEn {
	TranslationsSignInFormPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	late final TranslationsSignInFormPasswordErrorEn error = TranslationsSignInFormPasswordErrorEn._(_root);
}

// Path: signIn.form.submit
class TranslationsSignInFormSubmitEn {
	TranslationsSignInFormSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Sign In';
}

// Path: signUp.form.username
class TranslationsSignUpFormUsernameEn {
	TranslationsSignUpFormUsernameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Username';
	String get hint => 'john.doe';
	late final TranslationsSignUpFormUsernameErrorEn error = TranslationsSignUpFormUsernameErrorEn._(_root);
}

// Path: signUp.form.email
class TranslationsSignUpFormEmailEn {
	TranslationsSignUpFormEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get hint => 'john.doe@example.com';
	late final TranslationsSignUpFormEmailErrorEn error = TranslationsSignUpFormEmailErrorEn._(_root);
}

// Path: signUp.form.password
class TranslationsSignUpFormPasswordEn {
	TranslationsSignUpFormPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	late final TranslationsSignUpFormPasswordErrorEn error = TranslationsSignUpFormPasswordErrorEn._(_root);
}

// Path: signUp.form.submit
class TranslationsSignUpFormSubmitEn {
	TranslationsSignUpFormSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Sign Up';
}

// Path: signUp.resendEmailVerification.dialog
class TranslationsSignUpResendEmailVerificationDialogEn {
	TranslationsSignUpResendEmailVerificationDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Email Verification Link';
	String get cancel => 'Cancel';
	late final TranslationsSignUpResendEmailVerificationDialogSubmitEn submit = TranslationsSignUpResendEmailVerificationDialogSubmitEn._(_root);
}

// Path: forgotPassword.form.email.error
class TranslationsForgotPasswordFormEmailErrorEn {
	TranslationsForgotPasswordFormEmailErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your email address.';
	String get invalid => 'Please enter a valid email address.';
}

// Path: profile.actions.deleteAccount.dialog
class TranslationsProfileActionsDeleteAccountDialogEn {
	TranslationsProfileActionsDeleteAccountDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete Account';
	String get cancel => 'Cancel';
	late final TranslationsProfileActionsDeleteAccountDialogSubmitEn submit = TranslationsProfileActionsDeleteAccountDialogSubmitEn._(_root);
}

// Path: resetPassword.form.password.error
class TranslationsResetPasswordFormPasswordErrorEn {
	TranslationsResetPasswordFormPasswordErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter a password.';
	String get invalid => 'Minimum 8 characters, upper and lower case, with at least one special character.';
}

// Path: signIn.form.email.error
class TranslationsSignInFormEmailErrorEn {
	TranslationsSignInFormEmailErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your email address.';
	String get invalid => 'Please enter a valid email address.';
}

// Path: signIn.form.password.error
class TranslationsSignInFormPasswordErrorEn {
	TranslationsSignInFormPasswordErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter a password.';
}

// Path: signUp.form.username.error
class TranslationsSignUpFormUsernameErrorEn {
	TranslationsSignUpFormUsernameErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your username.';
	String get invalid => 'Please enter a valid username.';
}

// Path: signUp.form.email.error
class TranslationsSignUpFormEmailErrorEn {
	TranslationsSignUpFormEmailErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter your email address.';
	String get invalid => 'Please enter a valid email address.';
}

// Path: signUp.form.password.error
class TranslationsSignUpFormPasswordErrorEn {
	TranslationsSignUpFormPasswordErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Please enter a password.';
	String get invalid => 'Minimum 8 characters, upper and lower case, with at least one special character.';
}

// Path: signUp.resendEmailVerification.dialog.submit
class TranslationsSignUpResendEmailVerificationDialogSubmitEn {
	TranslationsSignUpResendEmailVerificationDialogSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Resend';
	String get success => 'Your email verification link was resent.';
}

// Path: profile.actions.deleteAccount.dialog.submit
class TranslationsProfileActionsDeleteAccountDialogSubmitEn {
	TranslationsProfileActionsDeleteAccountDialogSubmitEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Delete Account';
	String get success => 'Your account was deleted.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'emailVerificationLinkSent.title': return 'Email Verification Link Sent';
			case 'emailVerificationLinkSent.subtitle': return 'Check your email for you email verification link.';
			case 'forgotPassword.title': return 'Forgot Password?';
			case 'forgotPassword.form.email.label': return 'Email';
			case 'forgotPassword.form.email.hint': return 'john.doe@example.com';
			case 'forgotPassword.form.email.error.empty': return 'Please enter your email address.';
			case 'forgotPassword.form.email.error.invalid': return 'Please enter a valid email address.';
			case 'forgotPassword.form.submit.label': return 'Reset Password';
			case 'homeShell.navigationBar.home.label': return 'Home';
			case 'homeShell.navigationBar.profile.label': return 'Profile';
			case 'home.title': return 'Memeco';
			case 'profile.title': return 'Profile';
			case 'profile.actions.signOut.label': return 'Sign Out';
			case 'profile.actions.editProfile.label': return 'Edit Profile';
			case 'profile.actions.deleteAccount.label': return 'Delete Account';
			case 'profile.actions.deleteAccount.dialog.title': return 'Delete Account';
			case 'profile.actions.deleteAccount.dialog.cancel': return 'Cancel';
			case 'profile.actions.deleteAccount.dialog.submit.label': return 'Delete Account';
			case 'profile.actions.deleteAccount.dialog.submit.success': return 'Your account was deleted.';
			case 'resetPasswordLinkSent.title': return 'Reset Password Link';
			case 'resetPasswordLinkSent.subtitle': return 'Check your email for your reset password link.';
			case 'resetPasswordLinkSent.resend.question': return 'Didn\'t receive a link?';
			case 'resetPasswordLinkSent.resend.action': return 'Resend';
			case 'resetPasswordLinkSent.resend.success': return 'Your reset password link was resent.';
			case 'resetPassword.title': return 'Reset Password';
			case 'resetPassword.form.password.label': return 'Password';
			case 'resetPassword.form.password.error.empty': return 'Please enter a password.';
			case 'resetPassword.form.password.error.invalid': return 'Minimum 8 characters, upper and lower case, with at least one special character.';
			case 'resetPassword.form.submit.label': return 'Reset Password';
			case 'resetPassword.form.submit.success': return 'Your password was reset.';
			case 'signIn.title': return 'Sign In';
			case 'signIn.signUp.question': return 'Need an account?';
			case 'signIn.signUp.action': return 'Sign Up';
			case 'signIn.forgotPassword.question': return 'Forgot password?';
			case 'signIn.form.email.label': return 'Email';
			case 'signIn.form.email.hint': return 'john.doe@example.com';
			case 'signIn.form.email.error.empty': return 'Please enter your email address.';
			case 'signIn.form.email.error.invalid': return 'Please enter a valid email address.';
			case 'signIn.form.password.label': return 'Password';
			case 'signIn.form.password.error.empty': return 'Please enter a password.';
			case 'signIn.form.submit.label': return 'Sign In';
			case 'signUp.title': return 'Sign Up';
			case 'signUp.form.username.label': return 'Username';
			case 'signUp.form.username.hint': return 'john.doe';
			case 'signUp.form.username.error.empty': return 'Please enter your username.';
			case 'signUp.form.username.error.invalid': return 'Please enter a valid username.';
			case 'signUp.form.email.label': return 'Email';
			case 'signUp.form.email.hint': return 'john.doe@example.com';
			case 'signUp.form.email.error.empty': return 'Please enter your email address.';
			case 'signUp.form.email.error.invalid': return 'Please enter a valid email address.';
			case 'signUp.form.password.label': return 'Password';
			case 'signUp.form.password.error.empty': return 'Please enter a password.';
			case 'signUp.form.password.error.invalid': return 'Minimum 8 characters, upper and lower case, with at least one special character.';
			case 'signUp.form.submit.label': return 'Sign Up';
			case 'signUp.resendEmailVerification.question': return 'Still need to verify you email?';
			case 'signUp.resendEmailVerification.action': return 'Resend';
			case 'signUp.resendEmailVerification.dialog.title': return 'Email Verification Link';
			case 'signUp.resendEmailVerification.dialog.cancel': return 'Cancel';
			case 'signUp.resendEmailVerification.dialog.submit.label': return 'Resend';
			case 'signUp.resendEmailVerification.dialog.submit.success': return 'Your email verification link was resent.';
			default: return null;
		}
	}
}

