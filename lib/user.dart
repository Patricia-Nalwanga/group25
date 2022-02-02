import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  static const DIRECTORY = "users";
  static const FOLLOWERSCOUNT = "followersCount";
  static const FOLLOWINGCOUNT = "followingCount";
  static const FOLLOWINGDIRECTORY = "following";
  static const FOLLOWERSDIRECTORY = "followers";

  static const LASTLOGINTIME = "lastLogin";
  static const LASTLOGOUTTIME = "lastLogout";
  static const FCMTOKENS = "userFCMTokens";

  static const USERNAME = "userName";
  static const TWITTER = "twitter";
  static const FACEBOOK = "facebook";
  static const INSTAGRAM = "instagram";
  static const TIKTOK = "tiktok";
  static const DESCRIPTION = "description";
  static const EMAIL = "email";
  static const PHONENUMBER = "phoneNumber";
  static const PROFILEPIC = "profilePic";
  static const IMAGES = "images";

  static const CINEMA = "cinema";

  String _id;
  String _email;
  String _userName;
  List _cinema;
  String _profilePic;
  String _phoneNumber;
  String _description;
  String _twitter;
  String _facebook;
  String _instagram;
  String _tiktok;
  String _deviceToken;
  List _images;

  String get email => _email;
  String get id => _id;
  String get userName => _userName;
  String get description => _description;
  String get profilePic => _profilePic;
  String get twitter => _twitter;
  String get facebook => _facebook;
  String get instagram => _instagram;
  String get tiktok => _tiktok;
  List get images => _images;
  String get phoneNumber => _phoneNumber;
  List get cinema => _cinema;
  String get deviceToken => _deviceToken;

  UserModel.fromSnapshot(
    DocumentSnapshot snapshot,
  ) {
    Map pp = snapshot.data() as Map;

    _phoneNumber = pp[PHONENUMBER];
    _userName = pp[USERNAME];
    _profilePic = pp[PROFILEPIC];
    _email = pp[EMAIL];
    _description = pp[DESCRIPTION];
    _images = pp[IMAGES];
    _twitter = pp[TWITTER];
    _facebook = pp[FACEBOOK];
    _instagram = pp[INSTAGRAM];
    _cinema = pp[CINEMA] ?? [];
    _tiktok = pp[TIKTOK];
    _id = snapshot.id;
  }

  UserModel.fromData({
    @required String phoneNumber,
    @required String username,
    @required String profilePic,
    @required String email,
    @required List images,
  }) {
    _phoneNumber = phoneNumber;
    _userName = username;
    _profilePic = profilePic;
    _email = email;
    _images = images;
  }
}
