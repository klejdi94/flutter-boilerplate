import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:boilerplate/app/self_improvement/esempio9/model/profileModel.dart';
import 'package:boilerplate/app/self_improvement/esempio9/provider/profile.dart';

//(1)CustomScrollView - (2)SliverToBoxAdapter - (3)SliverGrid - (4)BottomNavigationBar",
/*(1)Rende una pagina, composta da componenti eterogenee, scrollabile 
/ (2)Vrappa un componente classico in uno sliver 
  (3)è una GridView di tipo sliver 
  (4)Barra di navigazione inferiore 
  - Uno Sliver è una porzione di pagina scrollabile
*/
class Esempio9 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio9';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill Gates"),
        centerTitle: true,
      ),
      body: ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.indigo),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: downloadUserProfile(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container();
          default:
            if (snapshot.error != null) {
              return Center(
                child: Icon(Icons.error, size: 30),
              );
            } else {
              ProfileModel profile = snapshot.data as ProfileModel;

              return CustomScrollView(
                slivers: [
                  profileHeader(profile.user),
                  photoGrid(profile.posts)
                ],
              );
            }
        }
      },
    );
  }
}

Widget profileHeader(UserModel user) {
  final List<String> labels = ["posts", "followers", "following"];
  final List<String> values = [
    user.numPosts.toString(),
    user.numFollowers.toString(),
    user.numFollowing.toString()
  ];

  return SliverToBoxAdapter(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@${user.userName}",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 35,
                          color: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Segui",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                user.fullName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 3,
              ),
              Text(user.bio),
              TextButton(
                  onPressed: () {},
                  child: Text(user.link),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: Colors.indigo.shade900))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12, width: 1))),
          child: Row(
              children: List.generate(
                  labels.length,
                  (index) => Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                values[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                labels[index],
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ))),
        )
      ],
    ),
  );
}

Widget photoGrid(List<PostModel> posts) => SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      delegate: SliverChildListDelegate(List.generate(
          posts?.length ?? 0,
          (index) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posts[index].imageUrl),
                        fit: BoxFit.cover)),
              ))),
    );
