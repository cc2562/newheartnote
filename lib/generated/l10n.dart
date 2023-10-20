// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `你好`
  String get hello {
    return Intl.message(
      '你好',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Mood temperature curve`
  String get hearts {
    return Intl.message(
      'Mood temperature curve',
      name: 'hearts',
      desc: '',
      args: [],
    );
  }

  /// `The better the mood,the higher the temperature will be!`
  String get heartsbotton {
    return Intl.message(
      'The better the mood,the higher the temperature will be!',
      name: 'heartsbotton',
      desc: '',
      args: [],
    );
  }

  /// `Mood statistics`
  String get Mood_statistics {
    return Intl.message(
      'Mood statistics',
      name: 'Mood_statistics',
      desc: '',
      args: [],
    );
  }

  /// `Follow this week's mood`
  String get focusweekmood {
    return Intl.message(
      'Follow this week\'s mood',
      name: 'focusweekmood',
      desc: '',
      args: [],
    );
  }

  /// `happy`
  String get happy {
    return Intl.message(
      'happy',
      name: 'happy',
      desc: '',
      args: [],
    );
  }

  /// `agitated`
  String get agitated {
    return Intl.message(
      'agitated',
      name: 'agitated',
      desc: '',
      args: [],
    );
  }

  /// `sad`
  String get sad {
    return Intl.message(
      'sad',
      name: 'sad',
      desc: '',
      args: [],
    );
  }

  /// `calm`
  String get calm {
    return Intl.message(
      'calm',
      name: 'calm',
      desc: '',
      args: [],
    );
  }

  /// `excited`
  String get excited {
    return Intl.message(
      'excited',
      name: 'excited',
      desc: '',
      args: [],
    );
  }

  /// `mad`
  String get mad {
    return Intl.message(
      'mad',
      name: 'mad',
      desc: '',
      args: [],
    );
  }

  /// `confused`
  String get confused {
    return Intl.message(
      'confused',
      name: 'confused',
      desc: '',
      args: [],
    );
  }

  /// `before`
  String get before {
    return Intl.message(
      'before',
      name: 'before',
      desc: '',
      args: [],
    );
  }

  /// `recently`
  String get recently {
    return Intl.message(
      'recently',
      name: 'recently',
      desc: '',
      args: [],
    );
  }

  /// `mood`
  String get mood {
    return Intl.message(
      'mood',
      name: 'mood',
      desc: '',
      args: [],
    );
  }

  /// `diary`
  String get diary {
    return Intl.message(
      'diary',
      name: 'diary',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get year {
    return Intl.message(
      '-',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `-`
  String get month {
    return Intl.message(
      '-',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get day {
    return Intl.message(
      '',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `All Tags`
  String get alltags {
    return Intl.message(
      'All Tags',
      name: 'alltags',
      desc: '',
      args: [],
    );
  }

  /// `Tag`
  String get tag {
    return Intl.message(
      'Tag',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `save successfully`
  String get savesucess {
    return Intl.message(
      'save successfully',
      name: 'savesucess',
      desc: '',
      args: [],
    );
  }

  /// `Select Tags`
  String get Select_Tags {
    return Intl.message(
      'Select Tags',
      name: 'Select_Tags',
      desc: '',
      args: [],
    );
  }

  /// `Make the diary neat and tidy`
  String get tagunder {
    return Intl.message(
      'Make the diary neat and tidy',
      name: 'tagunder',
      desc: '',
      args: [],
    );
  }

  /// `Select photo`
  String get Select_photo {
    return Intl.message(
      'Select photo',
      name: 'Select_photo',
      desc: '',
      args: [],
    );
  }

  /// `Selected tags`
  String get Selected_tag {
    return Intl.message(
      'Selected tags',
      name: 'Selected_tag',
      desc: '',
      args: [],
    );
  }

  /// `All tags`
  String get All_tags {
    return Intl.message(
      'All tags',
      name: 'All_tags',
      desc: '',
      args: [],
    );
  }

  /// `Create a new Tag`
  String get new_tag {
    return Intl.message(
      'Create a new Tag',
      name: 'new_tag',
      desc: '',
      args: [],
    );
  }

  /// `Collectible Pictures`
  String get Collectible_Pictures {
    return Intl.message(
      'Collectible Pictures',
      name: 'Collectible_Pictures',
      desc: '',
      args: [],
    );
  }

  /// `Selected photos will be saved with your diary`
  String get Selected_photos_will_be_saved_with_your_diary {
    return Intl.message(
      'Selected photos will be saved with your diary',
      name: 'Selected_photos_will_be_saved_with_your_diary',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get Mood_Calendar {
    return Intl.message(
      'Calendar',
      name: 'Mood_Calendar',
      desc: '',
      args: [],
    );
  }

  /// `Myself`
  String get Myself {
    return Intl.message(
      'Myself',
      name: 'Myself',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get January {
    return Intl.message(
      'January',
      name: 'January',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get February {
    return Intl.message(
      'February',
      name: 'February',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get March {
    return Intl.message(
      'March',
      name: 'March',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get April {
    return Intl.message(
      'April',
      name: 'April',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get May {
    return Intl.message(
      'May',
      name: 'May',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get June {
    return Intl.message(
      'June',
      name: 'June',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get July {
    return Intl.message(
      'July',
      name: 'July',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get August {
    return Intl.message(
      'August',
      name: 'August',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get September {
    return Intl.message(
      'September',
      name: 'September',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get October {
    return Intl.message(
      'October',
      name: 'October',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get November {
    return Intl.message(
      'November',
      name: 'November',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get December {
    return Intl.message(
      'December',
      name: 'December',
      desc: '',
      args: [],
    );
  }

  /// `Leave your thoughts`
  String get Leave_your_thoughts {
    return Intl.message(
      'Leave your thoughts',
      name: 'Leave_your_thoughts',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save_your_thought {
    return Intl.message(
      'save',
      name: 'save_your_thought',
      desc: '',
      args: [],
    );
  }

  /// `Not recorded`
  String get Not_recorded {
    return Intl.message(
      'Not recorded',
      name: 'Not_recorded',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Record with heart`
  String get Record_with_heart {
    return Intl.message(
      'Record with heart',
      name: 'Record_with_heart',
      desc: '',
      args: [],
    );
  }

  /// `attention`
  String get attention {
    return Intl.message(
      'attention',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this journal? Thoughts and journals will be deleted`
  String get rtdn {
    return Intl.message(
      'Are you sure you want to delete this journal? Thoughts and journals will be deleted',
      name: 'rtdn',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to delete this thought`
  String get rtdj {
    return Intl.message(
      'Would you like to delete this thought',
      name: 'rtdj',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No Tag`
  String get No_Tag {
    return Intl.message(
      'No Tag',
      name: 'No_Tag',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Personalize your diary`
  String get Personalize_your_diary {
    return Intl.message(
      'Personalize your diary',
      name: 'Personalize_your_diary',
      desc: '',
      args: [],
    );
  }

  /// `combination lock`
  String get combination_lock {
    return Intl.message(
      'combination lock',
      name: 'combination_lock',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Prevent others from accessing the diary`
  String get pofatd {
    return Intl.message(
      'Prevent others from accessing the diary',
      name: 'pofatd',
      desc: '',
      args: [],
    );
  }

  /// `Sets the theme`
  String get Sets_the_theme {
    return Intl.message(
      'Sets the theme',
      name: 'Sets_the_theme',
      desc: '',
      args: [],
    );
  }

  /// `User Agreement`
  String get User_Agreement {
    return Intl.message(
      'User Agreement',
      name: 'User_Agreement',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get Privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'Privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get About_Us {
    return Intl.message(
      'About us',
      name: 'About_Us',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pwd {
    return Intl.message(
      'Password',
      name: 'pwd',
      desc: '',
      args: [],
    );
  }

  /// `Set password`
  String get set_pwd {
    return Intl.message(
      'Set password',
      name: 'set_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Set a numeric password`
  String get set_pwd_number {
    return Intl.message(
      'Set a numeric password',
      name: 'set_pwd_number',
      desc: '',
      args: [],
    );
  }

  /// `Delete the password`
  String get del_pwd {
    return Intl.message(
      'Delete the password',
      name: 'del_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Clear password protection`
  String get clear_pwd {
    return Intl.message(
      'Clear password protection',
      name: 'clear_pwd',
      desc: '',
      args: [],
    );
  }

  /// `Please set a 4-digit password`
  String get Please_set_a_4_digit_password {
    return Intl.message(
      'Please set a 4-digit password',
      name: 'Please_set_a_4_digit_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter it again`
  String get Please_enter_it_again {
    return Intl.message(
      'Please enter it again',
      name: 'Please_enter_it_again',
      desc: '',
      args: [],
    );
  }

  /// `There must be four numbers`
  String get There_must_be_four_numbers {
    return Intl.message(
      'There must be four numbers',
      name: 'There_must_be_four_numbers',
      desc: '',
      args: [],
    );
  }

  /// `The two passwords were entered inconsistently`
  String get The_two_passwords_were_entered_inconsistently {
    return Intl.message(
      'The two passwords were entered inconsistently',
      name: 'The_two_passwords_were_entered_inconsistently',
      desc: '',
      args: [],
    );
  }

  /// `Setup successful`
  String get Setup_successful {
    return Intl.message(
      'Setup successful',
      name: 'Setup_successful',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get Enter_your_password {
    return Intl.message(
      'Enter your password',
      name: 'Enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Password error`
  String get Password_error {
    return Intl.message(
      'Password error',
      name: 'Password_error',
      desc: '',
      args: [],
    );
  }

  /// `Quick verification`
  String get Quick_verification {
    return Intl.message(
      'Quick verification',
      name: 'Quick_verification',
      desc: '',
      args: [],
    );
  }

  /// `My Vip`
  String get my_vip {
    return Intl.message(
      'My Vip',
      name: 'my_vip',
      desc: '',
      args: [],
    );
  }

  /// `Vip have more exclusive features`
  String get vip_subtitle {
    return Intl.message(
      'Vip have more exclusive features',
      name: 'vip_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Creat you own id`
  String get creatyouid {
    return Intl.message(
      'Creat you own id',
      name: 'creatyouid',
      desc: '',
      args: [],
    );
  }

  /// `Creat your own password`
  String get creatpwd {
    return Intl.message(
      'Creat your own password',
      name: 'creatpwd',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
