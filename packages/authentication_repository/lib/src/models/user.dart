import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

/// {@template user}
/// User model
/// {@endtemplate}
@HiveType(typeId: 0)
class User extends Equatable {
  /// {@macro user}
  const User({required this.id, this.email, this.name, this.photo});

  /// Empty user
  static const empty = User(id: '');

  /// User id
  @HiveField(0)
  final String id;

  /// User email
  @HiveField(1)
  final String? email;

  /// User name
  @HiveField(2)
  final String? name;

  /// User photo
  @HiveField(3)
  final String? photo;

  /// User is empty
  bool get isEmpty => this == User.empty;

  /// User is not empty
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name, photo];
}
