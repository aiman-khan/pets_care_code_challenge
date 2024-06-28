import 'package:flutter/material.dart';

class Apis {
  Apis._();

  /// [auth]
  static const baseUrl =
      'https://api.avcons.naveedullah.me/api/eab424dc-9ae2-4bd5-92df-ce1dfa6ac8a3';
  static const registerDriver = '$baseUrl/auth/register-driver';
  static const loginDriver = '$baseUrl/auth/login-driver';
  static const initiateVerification = '$baseUrl/auth/initiate-verification';
  static const verifyOtp = '$baseUrl/auth/verify-otp';
  static const resetPassword = '$baseUrl/auth/reset-password';
  static const resetPasswordInitiateVerification =
      '$baseUrl/auth/reset-password-initiate-verification';
  static const deleteUser = '$baseUrl/delete-profile';

  /// [driver]
  static const currentUser = '$baseUrl/user';

  /// [vehicle]
  static const vehicleModels = '$baseUrl/vehicle-models';

  /// [profile]
  static const updateProfile = '$baseUrl/update-profile';
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
