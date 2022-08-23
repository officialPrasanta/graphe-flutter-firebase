class UserData {
  String? uid;
  String? createdAt;
  String? fullName;
  String? phoneNo;
  String? email;
  String? gender;

  UserData(
      {this.uid,
      this.createdAt,
      this.fullName,
      this.phoneNo,
      this.email,
      this.gender});

  UserData.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    createdAt = json['createdAt'];
    fullName = json['fullName'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['createdAt'] = createdAt;
    data['fullName'] = fullName;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['gender'] = gender;
    return data;
  }
}
