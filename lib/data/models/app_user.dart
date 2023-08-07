import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? name;
  final DateTime? birthDate;

  const AppUser({
    required this.name,
    required this.birthDate,
  });

  AppUser copyWith({
    String? name,
    DateTime? birthDate,
  }) {
    return AppUser(
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
        name,
        birthDate,
      ];

  @override
  String toString() {
    return 'AppUser { name: $name, birthDate: $birthDate }';
  }
}
