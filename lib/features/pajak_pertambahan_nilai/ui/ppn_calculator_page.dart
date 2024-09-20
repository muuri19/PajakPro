import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';

class PpnCalculatorPage extends StatefulWidget {
  static const routeName = 'pajak-pertambahan-nilai';
  const PpnCalculatorPage({super.key});

  @override
  _PpnCalculatorPageState createState() => _PpnCalculatorPageState();
}

class _PpnCalculatorPageState extends State<PpnCalculatorPage> {
  final TextEditingController _controller = TextEditingController();
  double _hasilPPN = 0;
  double _totalBayar = 0;

  // Fungsi untuk reset input dan data ke default
  void _resetInput() {
    _controller.clear(); // Membersihkan input field
    setState(() {
      _hasilPPN = 0; // Mengatur ulang hasil PPN ke 0
      _totalBayar = 0; // Mengatur ulang total bayar ke 0
    });
  }

  void _hitungPPN() {
    double hargaBarang = double.tryParse(_controller.text) ?? 0;
    setState(() {
      _hasilPPN = hitungPPN(hargaBarang);
      _totalBayar = hargaBarang + _hasilPPN;
    });
  }

  double hitungPPN(double hargaBarang) {
    const double tarifPPN = 0.11;
    return hargaBarang * tarifPPN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text('Pajak Pertambahan Nilai (PPN)'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextfield(controller: _controller, labelText: "Harga Barang"),
            const SizedBox(height: 16),
            ButtonCalculate(
              onPressed: _hitungPPN,
              text: 'Hitung PPN',
              color: Colors.green.shade900,
            ),
            const SizedBox(height: 16),
            // Tombol Reset
            ButtonCalculate(
              onPressed: _resetInput,
              text: 'Reset',
              color: Colors.red.shade700,
            ),
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
                        "💵 Pajak Pertambahan Nilai (PPN)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Rp $_hasilPPN',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "✅ Total yang harus dibayar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Rp $_totalBayar',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
