import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';

class PpnCalculatorPage extends StatefulWidget {
  static const routeName = 'pajak-pertambahan-nilai';
  const PpnCalculatorPage({super.key});

  @override
  _PpnCalculatorPageState createState() => _PpnCalculatorPageState();
}

class _PpnCalculatorPageState extends State<PpnCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  double _hasilPPN = 0;
  double _totalBayar = 0;

  void _resetInput() {
    _controller.clear();
    setState(() {
      _hasilPPN = 0;
      _totalBayar = 0;
    });
  }

  void _hitungPPN() {
    if (_formKey.currentState!.validate()) {
      double hargaBarang = double.tryParse(_controller.text) ?? 0;
      setState(() {
        _hasilPPN = hitungPPN(hargaBarang);
        _totalBayar = hargaBarang + _hasilPPN;
      });
    }
  }

  double hitungPPN(double hargaBarang) {
    const double tarifPPN = 0.11;
    return hargaBarang * tarifPPN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const CustomAppBar(
        title: "Pajak Pertambahan Nilai (PPN)",
        panduanPajak: 'Pajak Pertambahan Nilai (PPN)',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Tambahkan form key di sini
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  controller: _controller,
                  labelText: "Harga Barang",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field ini harus diisi';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Masukkan angka yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ButtonCalculate(
                  onPressed: _hitungPPN,
                  text: 'Hitung PPN',
                  color: Colors.green.shade900,
                ),
                const SizedBox(height: 16),
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
                            'Rp ${_hasilPPN.toStringAsFixed(2)}',
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
                            'Rp ${_totalBayar.toStringAsFixed(2)}',
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
        ),
      ),
    );
  }
}
