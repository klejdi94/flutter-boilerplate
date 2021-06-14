import 'package:flutter/cupertino.dart';

class ProfileModel {
  final UserModel user;
  final List<PostModel> posts;

  const ProfileModel({@required this.user, @required this.posts});

  factory ProfileModel.fromData(dynamic data) {
    //final UserModel user = UserModel.fromData(data["graphql"]["user"]);
    final UserModel user = UserModel(
        fullName: "Bill Gates",
        userName: "thisisbillgates",
        imageUrl:
            "https://scontent-mxp1-1.cdninstagram.com/v/t51.2885-19/s150x150/200169483_213631740472599_2793047709043594600_n.jpg?tp=1&_nc_ht=scontent-mxp1-1.cdninstagram.com&_nc_ohc=pb4kK-5GSAAAX_-AoO9&edm=ABfd0MgBAAAA&ccb=7-4&oh=0e05ece5bdf25aa546b93cacab051957&oe=60CDD6FE&_nc_sid=7bff83",
        bio:
            "Sharing things I'm learning through my foundation work and other interests.",
        link: "https://gatesnot.es/instagram",
        numPosts: 170,
        numFollowers: 6776486,
        numFollowing: 39);

/*     final List<dynamic> postsDynamic =
        data["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"];
    final List<PostModel> posts = postsDynamic
        .map((postData) => PostModel.fromData(postData["node"]))
        .toList(); */

    List<String> app = [
      "https://scontent-mxp1-1.cdninstagram.com/v/t51.2885-15/e35/p240x240/154084682_116964743766596_5553904160379906040_n.jpg?tp=1&_nc_ht=scontent-mxp1-1.cdninstagram.com&_nc_cat=108&_nc_ohc=6modu07kmvQAX9Ub6SD&edm=ABfd0MgBAAAA&ccb=7-4&oh=5d1b933a0cf2865eb37c1c7759195840&oe=60CA4268&_nc_sid=7bff83",
      "https://scontent-mxp1-1.cdninstagram.com/v/t51.2885-15/e35/144906353_158628392543601_7417589881074942233_n.jpg?tp=1&_nc_ht=scontent-mxp1-1.cdninstagram.com&_nc_cat=109&_nc_ohc=uHmpvxRW4GoAX9BB5WA&edm=ABfd0MgBAAAA&ccb=7-4&oh=5c3c324edb619ad87971be087c2c1ea7&oe=60C9FD5F&_nc_sid=7bff83",
      "https://scontent-mxp1-1.cdninstagram.com/v/t51.2885-15/e35/84329856_205372380606858_8203811981029383881_n.jpg?tp=1&_nc_ht=scontent-mxp1-1.cdninstagram.com&_nc_cat=106&_nc_ohc=CYWNUefsGAEAX9vKhOA&edm=ABfd0MgBAAAA&ccb=7-4&oh=d583229aec4a48a885fc008d6196ba9b&oe=60CA4E0D&_nc_sid=7bff83",
    ];

    final List<PostModel> posts = List<PostModel>.generate(
        21, (index) => PostModel(imageUrl: app[index % 3]));

    return ProfileModel(user: user, posts: posts);
  }
}

class UserModel {
  final String fullName;
  final String userName;
  final String imageUrl;
  final String bio;
  final String link;
  final int numPosts;
  final int numFollowers;
  final int numFollowing;

  const UserModel(
      {@required this.fullName,
      @required this.userName,
      @required this.imageUrl,
      @required this.bio,
      @required this.link,
      @required this.numPosts,
      @required this.numFollowers,
      @required this.numFollowing});

  factory UserModel.fromData(dynamic data) {
    String fullName = data["full_name"];
    String userName = data["username"];
    String imageUrl = data["profile_pic_url"];
    String bio = data["biography"];
    String link = data["external_url"];
    int numPosts = data["edge_owner_to_timeline_media"]["count"];
    int numFollowers = data["edge_followed_by"]["count"];
    int numFollowing = data["edge_follow"]["count"];

    return UserModel(
        fullName: fullName,
        userName: userName,
        imageUrl: imageUrl,
        bio: bio,
        link: link,
        numPosts: numPosts,
        numFollowers: numFollowers,
        numFollowing: numFollowing);
  }
}

class PostModel {
  final String imageUrl;

  const PostModel({@required this.imageUrl});

  factory PostModel.fromData(dynamic data) {
    final String imageUrl = data["display_url"];

    return PostModel(imageUrl: imageUrl);
  }
}
