class UserModel {
  String nickName = '';
  String fristName = '';
  String lastName = '';
  int age = 0;

  UserModel({this.nickName, this.fristName, this.lastName, this.age});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nickName: json['nick_name'] as String,
        fristName: json['frist_name'] as String,
        lastName: json['last_name'] as String,
        age: json['age'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nick_name': nickName,
        'frist_name': fristName,
        'last_name': lastName,
        'age': age = 0,
      };
}
