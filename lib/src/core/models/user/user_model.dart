class User {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String fullName;
  final String institution;
  final DateTime? dateOfBirth;
  final String? gender;
  final int points;
  final bool isVerified;
  final String image;
  final String referrer;
  final String? referralCode;
  final String emailToken;
  final String affiliateInfo;
  final String country;
  final BestGame? bestGame;
  final BestGame? sapphireGame;
  final BestGame? rubyGame;
  final BestGame? diamondGame;

  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    required this.fullName,
    required this.institution,
    this.dateOfBirth,
    this.gender,
    required this.points,
    required this.isVerified,
    this.image = '',
    this.referrer = '',
    this.referralCode,
    required this.emailToken,
    required this.affiliateInfo,
    required this.country,
    this.bestGame,
    this.sapphireGame,
    this.rubyGame,
    this.diamondGame
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      fullName: json['fullname'] ?? '',
      institution: json['institution'] ?? '',
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : null,
      gender: json['gender'] ?? '',
      points: json['points'] ?? 0,
      isVerified: json['is_verified'] ?? '',
      image: json['image'] ?? '',
      referrer: json['referrer'] ?? '',
      referralCode: json['referral_code'] ?? '',
      emailToken: json['email_token'] ?? '',
      affiliateInfo: json['affiliate_info'] ?? '',
      country: json['country'] ?? '',
      bestGame: json['best_game'] != null
          ? BestGame.fromJson(json['best_game'])
          : null,
      sapphireGame: json['best_game_sapphire'] != null
          ? BestGame.fromJson(json['best_game_sapphire'])
          : null,
      rubyGame: json['best_game_ruby'] != null
          ? BestGame.fromJson(json['best_game_ruby'])
          : null,
      diamondGame:  json['best_game_diamond'] != null
          ? BestGame.fromJson(json['best_game_diamond'])
          : null,
    );
  }
}

class BestGame {
  final String id;
  final String user;
  final double score;
  final bool active;
  final DateTime dateCreated;
  final DateTime dateUpdated;

  BestGame({
    required this.id,
    required this.user,
    required this.score,
    required this.active,
    required this.dateCreated,
    required this.dateUpdated,
  });

  factory BestGame.fromJson(Map<String, dynamic> json) {
    return BestGame(
      id: json['id'],
      user: json['user'],
      score: json['score'],
      active: json['active'],
      dateCreated: DateTime.parse(json['date_created']),
      dateUpdated: DateTime.parse(json['date_updated']),
    );
  }
}
