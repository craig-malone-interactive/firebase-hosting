import 'package:firebase_hosting/page/newsletter_page.dart';
import 'package:flutter/material.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Johannes Milke';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Color(0xFFed2229),
        ),
        home: NewsletterPage(),
      );
}
