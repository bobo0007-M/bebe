// import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String name;
  final String uid;
  final String email;

  AppUser({required this.name, required this.uid, required this.email});
  factory AppUser.fromJson(Map<String, dynamic> json){
    return AppUser(name: json ["name"], uid: json["uid"], email: json["email"]);
  }
  Map<String, dynamic> toJson(){
    return{
      "name": name,
      "uid": uid,
      "email":email,
    };
  }
}