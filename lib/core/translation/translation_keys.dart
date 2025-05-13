import 'package:flutter/material.dart';

import '../cache/cache_keys.dart';

abstract class TranslationKeys
{
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);
  static const welcomeToDoIt ="welcome To\nDo It !";
  static const readyToConquer ="Ready to conquer your tasks? Let's Do It together.";
  static const letStart ="Let’s Start";
  static const doNotHaveAnAccount ="Don’t Have An Account?";
  static const register ="Register";
  static const alreadyHaveAnAccount ="Already Have An Account?";
  static const login ="login";
  static const userName ="Username";
  static const userPassword ="Password";
  static const userConfirmPassword ="Confirm password";
  static const hello ="hello";
  static const addTask ="addTask";
  static const title ="title";
  static const description ="description";
  static const group ="group";
  static const endDate ="endDate";
}