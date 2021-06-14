import 'package:boilerplate/app/self_improvement/esempio10/models/mail.dart';
import 'package:boilerplate/app/self_improvement/esempio10/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePageMail extends StatelessWidget {
  final colors = [Colors.teal, Colors.red, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.dehaze),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: mails.length,
        itemBuilder: (context, index) => mailRow(context, mails[index], index),
      ),
    );
  }

  Widget mailRow(BuildContext context, MailModel mail, int index) {
    final color = colors[index % colors.length];

    return ListTile(
      onTap: () {
//es 1 - Navigazione metodo push
        /*  Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(),
                settings: RouteSettings(
                    arguments: DetailPageArgs(mail: mail, color: color))));
         */

//es 2 - Navigazione con le routes (pushNamed)
/*         Navigator.pushNamed(context, 'mail/detail',
            arguments: DetailPageArgs(mail: mail, color: color)); */

//es 3 - Navigazione metodo push + Page Transition (Getione animazione)
/*         Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.bottomToTop,
                child: DetailPage(),
                settings: RouteSettings(
                    arguments: DetailPageArgs(mail: mail, color: color)))); */

//es 4 - Navigazione con le routes (pushNamed) + Page Transition (Getione animazione) aggiunta onGenerateRoute in MaterialApp
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: DetailPageArgs(mail: mail, color: color));
      },
      leading: CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Text(mails[index].title.substring(0, 2).toUpperCase(),
              style: TextStyle(color: Colors.white))),
      title: Text(mail.title),
      subtitle: Text(mail.content, overflow: TextOverflow.ellipsis),
      trailing: Text(mail.date, style: TextStyle(color: Colors.grey.shade500)),
    );
  }
}

final mails = [
  MailModel(
    title: "American Express",
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie tortor augue, viverra scelerisque elit porttitor in. Suspendisse aliquet ante quis quam dictum suscipit. Pellentesque mauris urna, tempor sit amet finibus vitae, rutrum scelerisque erat. Etiam leo turpis, malesuada eget nisi nec, tempus auctor lectus. Nullam eleifend nibh vitae ante malesuada, eget aliquam nulla luctus. Nunc non pretium mi. Cras sagittis maximus dictum. Nullam ornare aliquam eros. Curabitur augue mauris, pulvinar in porttitor eu, hendrerit non dui. Nulla ac interdum ante.",
    date: "23 May",
  ),
  MailModel(
    title: "Google",
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie tortor augue, viverra scelerisque elit porttitor in. Suspendisse aliquet ante quis quam dictum suscipit. Pellentesque mauris urna, tempor sit amet finibus vitae, rutrum scelerisque erat. Etiam leo turpis, malesuada eget nisi nec, tempus auctor lectus. Nullam eleifend nibh vitae ante malesuada, eget aliquam nulla luctus. Nunc non pretium mi. Cras sagittis maximus dictum. Nullam ornare aliquam eros. Curabitur augue mauris, pulvinar in porttitor eu, hendrerit non dui. Nulla ac interdum ante.",
    date: "21 May",
  ),
  MailModel(
    title: "Facebook",
    content:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie tortor augue, viverra scelerisque elit porttitor in. Suspendisse aliquet ante quis quam dictum suscipit. Pellentesque mauris urna, tempor sit amet finibus vitae, rutrum scelerisque erat. Etiam leo turpis, malesuada eget nisi nec, tempus auctor lectus. Nullam eleifend nibh vitae ante malesuada, eget aliquam nulla luctus. Nunc non pretium mi. Cras sagittis maximus dictum. Nullam ornare aliquam eros. Curabitur augue mauris, pulvinar in porttitor eu, hendrerit non dui. Nulla ac interdum ante.",
    date: "20 May",
  ),
];
