// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Modern App';

  @override
  String get welcomeMessage => 'Welcome Back!';

  @override
  String get homeTitle => 'Minimalist Design';

  @override
  String get error_network => 'Network error, please check your connection.';

  @override
  String get error_unauthorized => 'Session expired, please log in again.';

  @override
  String get error_bad_request => 'Invalid request.';

  @override
  String get error_server => 'Server error, please try again later.';

  @override
  String error_moderation(String reason) {
    return 'Content violation: $reason';
  }

  @override
  String get moderation_default_reason => 'unacceptable content';

  @override
  String get error_unknown => 'An unknown error occurred.';

  @override
  String get login_welcome => 'Welcome Back';

  @override
  String get login_subtitle => 'Please enter your Supabase credentials to log in';

  @override
  String get login_email => 'Email Address';

  @override
  String get login_password => 'Password';

  @override
  String get login_submit => 'Secure Login';

  @override
  String get login_error_email_empty => 'Please enter your email';

  @override
  String get login_error_email_invalid => 'Please enter a valid email';

  @override
  String get login_error_password_empty => 'Please enter your password';

  @override
  String get login_error_password_length => 'Password must be at least 6 characters';

  @override
  String login_failed(String reason) {
    return 'Login failed: $reason';
  }
}
