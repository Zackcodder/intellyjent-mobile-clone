import 'package:intellyjent/src/core/core.dart';

class UserData {
  static String? _id;
  static String? _token;
  static String? _email;
  static String? _fullName;
  static String? _username;
  static String? _emailToken;
  static String? _signUpTime;
  static String? _registrationStep;
  static late bool _hasOpenedApp;
  static int? _points;
  static String? _image;
  static String? _institution;
  static DateTime? _dateOfBirth;
  static String? _gender;
  static String? _referrer;
  static String? _referralCode;
  static String? _affiliateInfo;
  static String? _country;
  static bool? _isVerified;
  static String? _phone;
  static String? _currentPassword;
  static String? _deviceId;
  static double? _score;
  static int? _position;


  static double? get score => _score;
  static String? get token => _token;
  static String? get deviceId => _deviceId;
  static String? get currentPassword => _currentPassword;
  static String? get email => _email;
  static String? get fullname => _fullName;
  static String? get username => _username;
  static String? get emailToken => _emailToken;
  static DateTime? get signUpTime => DateTime.tryParse(_signUpTime!);
  static RegistrationStep? get registrationStep =>
      _registrationStep?.convertToStep();
  static bool get hasOpenedApp => _hasOpenedApp;
  static String? get userId => _id;
  static int? get points => _points;
  static String? get image => _image;
  static String? get institution => _institution;
  static DateTime? get dateOfBirth => _dateOfBirth;
  static String? get gender => _gender;
  static String? get referrer => _referrer;
  static String? get referralCode => _referralCode;
  static String? get affiliateInfo => _affiliateInfo;
  static String? get country => _country;
  static bool? get isVerified => _isVerified;
  static String? get phone => _phone;
  static int? get position => _position;

  static set score(double? value) {
    _score = value;
    SecureCache.writeToCache(CacheKeys.score, value?.toString());
  }

  static set position(int? value) {
    _position = value;
    SecureCache.writeToCache(CacheKeys.position, value?.toString());
  }

  static String get roundedScoreAsString {
    return _score == null ? '0' : _score!.round().toString();
  }

  static set token(String? value) {
    _token = value;
    SecureCache.writeToCache(CacheKeys.token, value);
  }

  static set hasOpenedApp(bool value) {
    _hasOpenedApp = value;
    SecureCache.writeToCache(CacheKeys.hasOpenedApp, value.toString());
  }

  static set points(int? value) {
    _points = value;
    SecureCache.writeToCache(CacheKeys.points, value?.toString());
  }

  static set image(String? value) {
    _image = value;
    SecureCache.writeToCache(CacheKeys.image, value);
  }

  static set userId(String? value) {
    _id = value;
    SecureCache.writeToCache(CacheKeys.userId, value);
  }

  static set email(String? value) {
    _email = value;
    SecureCache.writeToCache(CacheKeys.email, value);
  }

  static set deviceId(String? value) {
    _deviceId = value;
    SecureCache.writeToCache(CacheKeys.deviceId, value);
  }

  static set username(String? value) {
    _username = value;
    SecureCache.writeToCache(CacheKeys.username, value);
  }

  static set fullName(String? value) {
    _fullName = value;
    SecureCache.writeToCache(CacheKeys.fullName, value);
  }

  static set emailToken(String? value) {
    _emailToken = value;
    SecureCache.writeToCache(CacheKeys.emailToken, value);
  }

  static set currentPassword(String? value) {
    _currentPassword = value;
    SecureCache.writeToCache(CacheKeys.currentPassword, value);
  }

  static set signUpTime(DateTime? value) {
    _signUpTime = value?.toIso8601String();
    SecureCache.writeToCache(CacheKeys.signUpTime, value?.toIso8601String());
  }

  static set registrationStep(RegistrationStep? value) {
    _registrationStep = value.toString();
    SecureCache.writeToCache(CacheKeys.registrationStep, value.toString());
  }

  static set institution(String? value) {
    _institution = value;
    SecureCache.writeToCache(CacheKeys.institution, value);
  }

  static set dateOfBirth(DateTime? value) {
    _dateOfBirth = value;
    SecureCache.writeToCache(CacheKeys.dateOfBirth, value?.toIso8601String());
  }

  static set gender(String? value) {
    _gender = value;
    SecureCache.writeToCache(CacheKeys.gender, value);
  }

  static set referrer(String? value) {
    _referrer = value;
    SecureCache.writeToCache(CacheKeys.referrer, value);
  }

  static set referralCode(String? value) {
    _referralCode = value;
    SecureCache.writeToCache(CacheKeys.referralCode, value);
  }

  static set affiliateInfo(String? value) {
    _affiliateInfo = value;
    SecureCache.writeToCache(CacheKeys.affiliateInfo, value);
  }

  static set country(String? value) {
    _country = value;
    SecureCache.writeToCache(CacheKeys.country, value);
  }

  static set isVerified(bool? value) {
    _isVerified = value;
    SecureCache.writeToCache(CacheKeys.isVerified, value?.toString());
  }

  static set phone(String? value) {
    _phone = value;
    SecureCache.writeToCache(CacheKeys.phone, value);
  }


  static updateAll(Map<String, dynamic> json) {
    if (json.containsKey("token")) {
      token = json["token"];
    }
    emailToken = json["email_token"];
    email = json["email"];
    username = json["username"];
    fullName = json["fullname"];
    userId = json["id"];
    points = json["points"];
    image = json["image"];
    registrationStep = RegistrationStep.otpVerification;
    signUpTime = DateTime.now();
    institution = json["institution"];
    dateOfBirth = DateTime.tryParse(json["date_of_birth"]??DateTime.now().toIso8601String());
    gender = json["gender"];
    referrer = json["referrer"];
    referralCode = json["referral_code"];
    affiliateInfo = json["affiliate_info"];
    country = json["country"];
    isVerified = json["is_verified"];
    phone = json["phone"];
    if (json.containsKey("current_password")) {
      currentPassword = json["current_password"];
    }
    if (json.containsKey("current_password")) {
      deviceId = json["X-Device-Id"];
    }
    if (json.containsKey("score")) {
      score = json["score"];
    }
    if (json.containsKey("best_game")) {
      Map<String, dynamic> bestGame = json["best_game"] ?? {};
      if (bestGame.containsKey("score")) {
        score = bestGame["score"];
      }
    }

  }

  static Future init() async {
    _token = await SecureCache.retrieveFromCache(CacheKeys.token);
    _emailToken = await SecureCache.retrieveFromCache(CacheKeys.emailToken);
    _score = double.tryParse(await SecureCache.retrieveFromCache(CacheKeys.score) ?? "0");
    _position = int.tryParse(await SecureCache.retrieveFromCache(CacheKeys.position) ?? "0");
    _email = await SecureCache.retrieveFromCache(CacheKeys.email);
    _username = await SecureCache.retrieveFromCache(CacheKeys.username);
    _fullName = await SecureCache.retrieveFromCache(CacheKeys.fullName);
    _deviceId = await SecureCache.retrieveFromCache(CacheKeys.deviceId);
    _id = await SecureCache.retrieveFromCache(CacheKeys.userId);
    await SecureCache.retrieveFromCache(CacheKeys.registrationStep)
        .then((value) {
      _registrationStep = value;
    });
    _signUpTime = 
        await SecureCache.retrieveFromCache(CacheKeys.signUpTime);
    _hasOpenedApp = bool.parse(
        await SecureCache.retrieveFromCache(CacheKeys.hasOpenedApp) ?? "false");
    _points = int.tryParse(await SecureCache.retrieveFromCache(CacheKeys.points) ?? "0");
    _image = await SecureCache.retrieveFromCache(CacheKeys.image);

    _institution = await SecureCache.retrieveFromCache(CacheKeys.institution);
    _dateOfBirth = DateTime.tryParse(
        await SecureCache.retrieveFromCache(CacheKeys.dateOfBirth) ?? "");
    _gender = await SecureCache.retrieveFromCache(CacheKeys.gender);
    _referrer = await SecureCache.retrieveFromCache(CacheKeys.referrer);
    _referralCode = await SecureCache.retrieveFromCache(CacheKeys.referralCode);
    _affiliateInfo = await SecureCache.retrieveFromCache(CacheKeys.affiliateInfo);
    _country = await SecureCache.retrieveFromCache(CacheKeys.country);
    _isVerified =
        bool.parse(await SecureCache.retrieveFromCache(CacheKeys.isVerified) ?? "false");
    _phone = await SecureCache.retrieveFromCache(CacheKeys.phone);
    _currentPassword = await SecureCache.retrieveFromCache(CacheKeys.currentPassword);
  }

  static void logout() {
    _token = null;
    _score = null;
    _position = null;
    _email = null;
    _deviceId = null;
    _fullName = null;
    _username = null;
    _emailToken = null;
    _signUpTime = null;
    _registrationStep = null;
    _points = null;
    _image = null;
    _institution = null;
    _dateOfBirth= null;
    _gender= null;
    _referrer= null;
    _referralCode= null;
    _affiliateInfo= null;
    _country= null;
    _isVerified= null;
    _phone= null;
    _currentPassword=null;

    // Clear values from the cache
    SecureCache.removeFromCache(CacheKeys.token);
    SecureCache.removeFromCache(CacheKeys.email);
    SecureCache.removeFromCache(CacheKeys.fullName);
    SecureCache.removeFromCache(CacheKeys.username);
    SecureCache.removeFromCache(CacheKeys.emailToken);
    SecureCache.removeFromCache(CacheKeys.signUpTime);
    SecureCache.removeFromCache(CacheKeys.registrationStep);
    SecureCache.removeFromCache(CacheKeys.points);
    SecureCache.removeFromCache(CacheKeys.image);
    SecureCache.removeFromCache(CacheKeys.institution);
    SecureCache.removeFromCache(CacheKeys.dateOfBirth);
    SecureCache.removeFromCache(CacheKeys.gender);
    SecureCache.removeFromCache(CacheKeys.referrer);
    SecureCache.removeFromCache(CacheKeys.referralCode);
    SecureCache.removeFromCache(CacheKeys.affiliateInfo);
    SecureCache.removeFromCache(CacheKeys.country);
    SecureCache.removeFromCache(CacheKeys.isVerified);
    SecureCache.removeFromCache(CacheKeys.phone);
    SecureCache.removeFromCache(CacheKeys.currentPassword);
    SecureCache.removeFromCache(CacheKeys.score);
    SecureCache.removeFromCache(CacheKeys.deviceId);

  }

}

extension on String {
  RegistrationStep? convertToStep() {
    if (this == RegistrationStep.otpVerification.toString()) {
      return RegistrationStep.otpVerification;
    } else if (this == RegistrationStep.signUp.toString()) {
      return RegistrationStep.signUp;
    } else if (this == RegistrationStep.username.toString()) {
      return RegistrationStep.username;
    } else {
      return null;
    }
  }
}

enum RegistrationStep { signUp, otpVerification, username }
