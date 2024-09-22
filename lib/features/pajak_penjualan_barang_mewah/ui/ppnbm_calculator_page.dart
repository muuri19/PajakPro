import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';

class PpnbmCalculatorPage extends StatefulWidget {
  static const routeName = 'pajak-penjualan-barang-mewah';

  const PpnbmCalculatorPage({super.key});
  @override
  _PpnbmCalculatorPageState createState() => _PpnbmCalculatorPageState();
}

class _PpnbmCalculatorPageState extends State<PpnbmCalculatorPage> {
  final TextEditingController _hargaController = TextEditingController();
  double _selectedTarif = 0.1; // Tarif default 10%
  double _hasilPPnBM = 0;

  // Daftar tarif PPnBM yang mungkin (contoh tarif)
  final List<double> _tarifList = [0.1, 0.2, 0.3, 0.4];

  void _hitungPPnBM() {
    double hargaBarang = double.tryParse(_hargaController.text) ?? 0;
    setState(() {
      _hasilPPnBM = hargaBarang * _selectedTarif;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Pajak Penjualan atas Barang Mewah"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
                controller: _hargaController, labelText: "Harga Barang"),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey), // Warna border bisa disesuaikan
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DropdownButton<double>(
                  value: _selectedTarif,
                  items: _tarifList.map((tarif) {
                    return DropdownMenuItem<double>(
                      value: tarif,
                      child: Text('${(tarif * 100).toStringAsFixed(0)}%'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTarif = value!;
                    });
                  },
                  underline:
                      const SizedBox(), // Menghilangkan underline default
                  isExpanded:
                      true, // Agar DropdownButton menyesuaikan lebar kontainer
                ),
              ),
            ),
            const SizedBox(height: 16),
            ButtonCalculate(
                onPressed: _hitungPPnBM,
                text: "Hitung PPnBM",
                color: Colors.green.shade900),
            const SizedBox(height: 16),
            Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "💵 PPnBM yang harus dibayar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Rp ${_hasilPPnBM.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
