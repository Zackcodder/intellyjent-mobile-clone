import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCache {
  static FlutterSecureStorage? storage;

  static init() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  static Future<String?> retrieveFromCache(CacheKeys key) async {
    if (storage == null) {
      init();
    }
    return await storage!.read(key: key.toString());
  }

  static Future removeFromCache(CacheKeys key) async {
    if (storage == null) {
      init();
    }
    await storage!.delete(key: key.toString());
  }

  static Future writeToCache(CacheKeys key, String? value) async {
    if (value == null) {
      return;
    }
    if (storage == null) {
      init();
    }
    await storage!.write(key: key.toString(), value: value);
  }
}

enum CacheKeys {
  token,
  fullName,
  username,
  score,
  emailToken,
  email,
  registrationStep,
  signUpTime,
  hasOpenedApp,
  userId,
  points,
  images,
  isVerified,
  phone,
  country,
  referralCode,
  affiliateInfo,
  referrer,
  gender,
  institution,
  dateOfBirth,
  image,
  currentPassword,
  position,
  notification,
  deviceId,
  tellybucksPin,
}
