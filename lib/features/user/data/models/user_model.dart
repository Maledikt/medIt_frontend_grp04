import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {
        required String userName,
        required String email,
        bool isSuperUser = false
      })
      : super(userName: userName, email: email, isSuperUser: isSuperUser);


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      userName: json["user_name"],
      email: json["email"],
      isSuperUser: json["is_superuser"]
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'user_name': userName, 'email': email, 'is_super_user': isSuperUser
    };
  }
}
