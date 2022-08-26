import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? uid;
  Timestamp? createdAt;
  String? fullName;
  String? phoneNo;
  String? email;
  String? gender;
  Timestamp? dob;

  UserData({
    this.uid,
    this.createdAt,
    this.fullName,
    this.phoneNo,
    this.email,
    this.gender,
    this.dob,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    createdAt = json['createdAt'];
    fullName = json['name'];
    phoneNo = json['phone'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['createdAt'] = createdAt;
    data['name'] = fullName;
    data['phone'] = phoneNo;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    return data;
  }
}
