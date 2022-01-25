import 'package:trips/User/model/user.dart';

class Place {
  String uid;
  String name;
  String description;
  String uriImage;
  int likes;
  UserModel userOwner;

  Place(
      {required this.uid,
      required this.name,
      required this.description,
      required this.uriImage,
      required this.likes,
      required this.userOwner});
}
