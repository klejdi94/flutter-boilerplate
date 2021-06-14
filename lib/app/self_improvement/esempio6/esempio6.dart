import 'package:flutter/material.dart';

class IntroPage {
  IntroPage(
      {@required this.title, @required this.subtitle, @required this.color});

  String title;
  String subtitle;
  Color color;
}

final List<IntroPage> _introPages = [
  IntroPage(
      title: "Platone",
      subtitle:
          "Gli uomini saggi parlano perché hanno qualcosa da dire; gli sciocchi perché devono dire qualcosa.",
      color: Colors.blue),
  IntroPage(
      title: "Euripide",
      subtitle:
          "Chi dice ciò che vuole deve aspettarsi in risposta ciò che non vuole.",
      color: Colors.indigo),
  IntroPage(
      title: "Ipazia",
      subtitle:
          "Salvaguardate il vostro diritto di pensare, perché anche pensare male è meglio di non pensare affatto.",
      color: Colors.black),
  IntroPage(
      title: "Papa Giovanni Paolo II",
      subtitle: "Prendete in mano la vostra vita e fatene un capolavoro.",
      color: Colors.red.shade900),
  IntroPage(
      title: "Socrate",
      subtitle: "L’unica vera saggezza è sapere di non sapere nulla.",
      color: Colors.teal)
];

//PageView + Dialog con modulo Login
//Es di PageView + es Dialog(Modale) con form di Login(ultima pagina icona V)
class Esempio6 extends StatefulWidget {
  static const String routeName = '/selfImprovement/esempio6';

  @override
  _Esempio6State createState() => _Esempio6State();
}

class _Esempio6State extends State<Esempio6> {
  final _pageController = PageController();
  int _selectedPageIndex = 0;

  void nextPage() {
    if (!isLastPage()) {
      _pageController.animateToPage(_selectedPageIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  bool isLastPage() {
    return _selectedPageIndex == _introPages.length - 1;
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void showLoginDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.person),
                          hintText: "Inserisci il tuo username",
                          labelText: "Username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                          hintText: "Inserisci la tua password",
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      minWidth: double.infinity,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      textColor: Colors.white,
                      child: Text("Login"),
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _introPages[_selectedPageIndex].color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Welcome!"),
        centerTitle: true,
        actions: [
          isLastPage()
              ? IconButton(
                  onPressed: showLoginDialog, icon: Icon(Icons.check_circle))
              : IconButton(onPressed: nextPage, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: PageView.builder(
          controller: _pageController,
          onPageChanged: onPageChanged,
          itemCount: _introPages.length,
          itemBuilder: (context, index) {
            return IntroPageView(_introPages[index]);
          }),
    );
  }
}

class IntroPageView extends StatelessWidget {
  IntroPageView(this.intropage);
  final IntroPage intropage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    intropage.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    intropage.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
