import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pajakpro/pages/article_page.dart';
import 'package:pajakpro/pages/dashboard_page.dart';
import 'package:pajakpro/pages/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PajakPro',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: NavigationPage.routeName,
      routes: {
        NavigationPage.routeName: (context) => const NavigationPage(),
        DashboardPage.routeName: (context) => const DashboardPage(),
        ArticlePage.routeName: (context) => const ArticlePage(),
      },
    );
  }
}
