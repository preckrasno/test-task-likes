import 'package:dreambit/data/enums/country.dart';
import 'package:dreambit/data/enums/gender.dart';
import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final Gender? gender;
  final Country? nationality;

  const Settings({
    required this.gender,
    required this.nationality,
  });

  Settings copyWith({
    Gender? gender,
    Country? nationality,
  }) {
    return Settings(
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  List<Object?> get props => [
        gender,
        nationality,
      ];

  @override
  String toString() {
    return 'Settings { gender: $gender, nationality: $nationality }';
  }
}
