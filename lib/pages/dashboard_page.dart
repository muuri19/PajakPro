import 'package:flutter/material.dart';
import 'package:pajakpro/features/bea_perolehan_hak_tanah_bangunan/ui/bphtb_calculator_page.dart';
import 'package:pajakpro/features/pajak_bumi_bangunan/ui/pbb_calculator_page.dart';
import 'package:pajakpro/features/pajak_kendaraan_bermotor/ui/pkb_calculator_page.dart';
import 'package:pajakpro/features/pajak_penghasilan/ui/pph_calculator_page.dart';
import 'package:pajakpro/features/pajak_penjualan_barang_mewah/ui/ppnbm_calculator_page.dart';
import 'package:pajakpro/features/pajak_pertambahan_nilai/ui/ppn_calculator_page.dart';
import 'package:pajakpro/widgets/button_menu_dashboard.dart';

class DashboardPage extends StatelessWidget {
  static const routeName = 'dashboard-page';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          "PajakPro",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              ButtonMenuDashboard(
                imagePath: 'assets/icons/pajak-penghasilan.png',
                text: "Pajak Penghasilan (PPh)",
                onPressed: () {
                  Navigator.pushNamed(context, PphCalculatorPage.routeName);
                },
              ),
              ButtonMenuDashboard(
                imagePath: 'assets/icons/pajak-pertambahan-nilai.png',
                text: "Pajak Pertambahan Nilai (PPN)",
                onPressed: () {
                  Navigator.pushNamed(context, PpnCalculatorPage.routeName);
                },
              ),
              ButtonMenuDashboard(
                imagePath: 'assets/icons/pajak-penjualan-atas-barang-mewah.png',
                text: "Pajak Penjualan atas Barang Mewah (PPnBM)",
                onPressed: () {
                  Navigator.pushNamed(context, PpnbmCalculatorPage.routeName);
                },
              ),
              ButtonMenuDashboard(
                imagePath: 'assets/icons/pajak-bumi-dan-bangunan.png',
                text: "Pajak Bumi dan Bangunan (PBB)",
                onPressed: () {
                  Navigator.pushNamed(context, PbbCalculatorPage.routeName);
                },
              ),
              ButtonMenuDashboard(
                imagePath: 'assets/icons/pajak-kendaraan-bermotor.png',
                text: "Pajak Kendaraan Bermotor (PKB)",
                onPressed: () {
                  Navigator.pushNamed(context, PkbCalculatorPage.routeName);
                },
              ),
              ButtonMenuDashboard(
                imagePath:
                    'assets/icons/bea-perolehan-hak-atas-tanah-dan-bangunan.png',
                text: "Bea Perolehan Hak atas Tanah dan Bangunan (BPHTB)",
                onPressed: () {
                  Navigator.pushNamed(context, BphtbCalculatorPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
