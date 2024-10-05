import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pajakpro/features/bea_perolehan_hak_tanah_bangunan/ui/bphtb_calculator_page.dart';
import 'package:pajakpro/features/pajak_bumi_bangunan/ui/pbb_calculator_page.dart';
import 'package:pajakpro/features/pajak_kendaraan_bermotor/ui/pkb_calculator_page.dart';
import 'package:pajakpro/features/pajak_penghasilan/ui/pph_calculator_page.dart';
import 'package:pajakpro/features/pajak_penjualan_barang_mewah/ui/ppnbm_calculator_page.dart';
import 'package:pajakpro/features/pajak_pertambahan_nilai/ui/ppn_calculator_page.dart';
import 'package:pajakpro/pages/article_page.dart';
import 'package:pajakpro/pages/dashboard_page.dart';
import 'package:pajakpro/pages/navigation_page.dart';
import 'package:pajakpro/pages/splash_screen.dart';

//Ini class main
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
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        NavigationPage.routeName: (context) => const NavigationPage(),
        DashboardPage.routeName: (context) => const DashboardPage(),
        ArticlePage.routeName: (context) => const ArticlePage(),

        // Feature
        PphCalculatorPage.routeName: (context) => const PphCalculatorPage(),
        PpnCalculatorPage.routeName: (context) => const PpnCalculatorPage(),
        PpnbmCalculatorPage.routeName: (context) => const PpnbmCalculatorPage(),
        PbbCalculatorPage.routeName: (context) => const PbbCalculatorPage(),
        PkbCalculatorPage.routeName: (context) => const PkbCalculatorPage(),
        BphtbCalculatorPage.routeName: (context) => const BphtbCalculatorPage()
      },
    );
  }
}
