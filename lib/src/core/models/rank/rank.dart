
import '../../core.dart';

part 'rank.freezed.dart';
part 'rank.g.dart';

@freezed
class LeaderboardItem with _$LeaderboardItem {
  const factory LeaderboardItem({
    required String username,
    required String? user_profile_image,
    @Default('User') String fullname,
    @Default('Nigeria') String? country,
    required String? date,
    required double score,
  }) = _LeaderboardItem;

  factory LeaderboardItem.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardItemFromJson(json);
}

@freezed
class LastWeeksWinners with _$LastWeeksWinners {
  const factory LastWeeksWinners({
    required String username,
    required String? user_profile_image,
    required String fullname,
    @Default('Nigeria') String? country,
    required String? date,
    required double score,
  }) = _LastWeeksWinners;

  factory LastWeeksWinners.fromJson(Map<String, dynamic> json) =>
      _$LastWeeksWinnersFromJson(json);
}
