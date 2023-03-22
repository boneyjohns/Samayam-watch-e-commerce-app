class ProfileModel {
  final String? username;
  final String? useremail;
  final String? userphoneNo;
  final String? image;

  ProfileModel(
      {required this.useremail,
      required this.username,
      required this.userphoneNo,
      this.image});

  Map<String, dynamic> toJson() => {
        'email': useremail,
        'username': username,
        'phone': userphoneNo,
        "image": image
      };

  static ProfileModel fromJson(Map<String, dynamic> json) => ProfileModel(
      useremail: json['email'],
      username: json['username'],
      userphoneNo: json['phone'],
      image: json['image']);
}
