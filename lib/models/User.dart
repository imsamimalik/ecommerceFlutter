// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../store/store.dart';

class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String address;
  final double walletBalance;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.address,
    required this.walletBalance,
  });

  User copyWith({
    int? id,
    String? username,
    String? name,
    String? email,
    String? address,
    double? walletBalance,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      walletBalance: walletBalance ?? this.walletBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'address': address,
      'walletBalance': walletBalance,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: int.parse(map['id'].toString()),
      username: map['username'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      walletBalance: double.parse(map['walletBalance'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, email: $email, address: $address, walletBalance: $walletBalance)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.name == name &&
        other.email == email &&
        other.address == address &&
        other.walletBalance == walletBalance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        walletBalance.hashCode;
  }
}

class LoginUser extends VxMutation<MyStore> {
  final token;

  LoginUser(this.token);

  @override
  perform() async {
    store!.token = token;
    store!.initOrders();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString('token', token);
  }
}

class LogoutUser extends VxMutation<MyStore> {

  @override
  perform() async {
    store?.token = '';
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove('token');
    await localStorage.remove('user');


    store!.user = User(
      id: -1,
      username: '',
      name: '',
      email: '',
      address: '',
      walletBalance: -1,
    );
  }
}

class PopulateUser extends VxMutation<MyStore> {
  final data;

  PopulateUser(this.data);
  @override
  perform() async {
    store!.user = User.fromMap(data);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('user', store!.user.toJson());
  }
}
