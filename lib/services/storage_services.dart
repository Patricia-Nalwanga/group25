import 'package:cloud_firestore/cloud_firestore.dart';

import '../user.dart';
import 'map_generation.dart';

class FirebaseServices {
  removeFCMToken(String userID) {
    /* FirebaseDatabase.instance.reference().child(UserModel.FCMTOKENS).update({
      userID: null,
    }); */

    //updateLastLogout(userID);
  }

  updateFCMToken(String userID, String token) {
    /*   FirebaseDatabase.instance.reference().child(UserModel.FCMTOKENS).update({
      userID: token,
    }); */

    //updateLastLogin(userID);
  }

  updateLastLogin(String uid) {
    /* FirebaseDatabase.instance
        .reference()
        .child(UserModel.LASTLOGINTIME)
        .child(uid)
        .update({
      DateTime.now().millisecondsSinceEpoch.toString(): true,
    }); */
  }

  createNewUser({
    String token,
    String phoneNumber,
    String email,
    String uid,
    String userName,
    List images,
  }) {
    UserModel user = UserModel.fromData(
      phoneNumber: phoneNumber,
      username: userName,
      images: images,
      profilePic: images.isEmpty ? null : images[0],
      email: email,
    );

    FirebaseFirestore.instance
        .collection(UserModel.DIRECTORY)
        .doc(uid)
        .set(
          MapGeneration().generateUserMap(user),
        )
        .then(
      (value) {
        updateFCMToken(
          uid,
          token,
        );

        updateLastLogin(uid);

        //TODO: Notify the person that they've logged in and send them a welcome message

        /* NotificationModel not = NotificationModel.fromData(
          uid,
          NotificationModel.WELCOMETOPLOTIT,
          DateTime.now(),
        );

        FirebaseFirestore.instance
            .collection(NotificationModel.DIRECTORY)
            .doc(uid)
            .collection(uid)
            .add(
              MapGeneration().generateNotificationMap(
                not,
              ),
            ); */
      },
    );
  }

  updateLastLogout(String uid) {
    /* FirebaseDatabase.instance
        .reference()
        .child(UserModel.LASTLOGOUTTIME)
        .child(uid)
        .update({
      DateTime.now().millisecondsSinceEpoch.toString(): true,
    }); */
  }
}
