// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '现代应用';

  @override
  String get welcomeMessage => '欢迎回来！';

  @override
  String get homeTitle => '极简现代设计';

  @override
  String get error_network => '网络连接错误，请稍后重试。';

  @override
  String get error_unauthorized => '登录失效，请重新登录。';

  @override
  String get error_bad_request => '请求无效。';

  @override
  String get error_server => '服务器错误，请稍后重试。';

  @override
  String error_moderation(String reason) {
    return '内容涉嫌违规：$reason';
  }

  @override
  String get moderation_default_reason => '含有违规内容';

  @override
  String get error_unknown => '发生未知错误。';

  @override
  String get login_welcome => '欢迎回来';

  @override
  String get login_subtitle => '请输入您的 Supabase 账号密码登录';

  @override
  String get login_email => '电子邮箱';

  @override
  String get login_password => '密码';

  @override
  String get login_submit => '安全登录';

  @override
  String get login_error_email_empty => '请输入邮箱';

  @override
  String get login_error_email_invalid => '请输入合法的邮箱';

  @override
  String get login_error_password_empty => '请输入密码';

  @override
  String get login_error_password_length => '密码长度不能少于 6 位';

  @override
  String login_failed(String reason) {
    return '登录失败: $reason';
  }

  @override
  String get retry => '重试';

  @override
  String get home_welcome => '欢迎使用';

  @override
  String get home_description => '这是一套在 iOS 和 Android 上都保持高度一致、简洁且现代的 UI 模板。';

  @override
  String get home_card_title => 'Material 3 核心驱动';

  @override
  String get home_card_subtitle => '完美平衡两端审美';

  @override
  String get home_explore => '开始探索';

  @override
  String get home_components_title => '常用组件示例';

  @override
  String get home_notifications => '通知推送';
}
