// ignore_for_file: public_member_api_docs
import 'package:equatable/equatable.dart';

class SupabaseUser extends Equatable {
  const SupabaseUser({
    this.id,
    required this.userName,
    required this.companyName,
  });

  factory SupabaseUser.fromJson(Map<String, dynamic> map) {
    return SupabaseUser(
      id: map['id'] as String?,
      userName: map['userName'] as String,
      companyName: map['companyName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'companyName': companyName,
    };
  }

  final String? id;
  final String userName;
  final String companyName;

  @override
  List<Object?> get props => [id, userName, companyName];
}
