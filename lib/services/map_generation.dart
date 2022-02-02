import '../user.dart';

class MapGeneration{
    generateUserMap(UserModel user) {
    return {
      UserModel.PHONENUMBER: user.phoneNumber,
      UserModel.USERNAME: user.userName,
      UserModel.PROFILEPIC: user.profilePic,
      UserModel.EMAIL: user.email,
      UserModel.CINEMA: user.cinema,
    };
  }

}