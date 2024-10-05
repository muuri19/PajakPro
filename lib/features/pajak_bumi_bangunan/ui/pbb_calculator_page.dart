import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';

import '../models/pbb_calculator.dart';

class PbbCalculatorPage extends StatefulWidget {
  static const routeName = 'Pajak-Bumi-Bangunan';

  const PbbCalculatorPage({super.key});

  @override
  _PbbCalculatorPageState createState() => _PbbCalculatorPageState();
}

class _PbbCalculatorPageState extends State<PbbCalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController njopController = TextEditingController();
  final TextEditingController taxRateController =
      TextEditingController(text: '0.002');
  final TextEditingController njoptkpController =
      TextEditingController(text: '10000000');

  double? pbbResult;

  void _calculatePBB() {
    if (_formKey.currentState!.validate()) {
      double njop = double.parse(njopController.text);
      double taxRate = double.parse(taxRateController.text);
      double njoptkp = double.parse(njoptkpController.text);

      PBBCalculator calculator =
          PBBCalculator(njop: njop, taxRate: taxRate, njoptkp: njoptkp);
      setState(() {
        pbbResult = calculator.calculatePBB();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Hitung Pajak Bumi dan Bangunan", panduanPajak: 'Hitung Pajak Bumi dan Bangunan',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: njopController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan NJOP',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.green.shade900, width: 2)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NJOP wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: taxRateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan Tarif Pajak (Contoh: 0.002)',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.green.shade900, width: 2)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tarif pajak wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: njoptkpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukkan NJOPTKP (Default: 10 juta)',
                  labelStyle: const TextStyle(color: Colors.black),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.black38, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Colors.green.shade900, width: 2)),
                ),
              ),
              const SizedBox(height: 20),
              ButtonCalculate(
                  onPressed: _calculatePBB,
                  text: "Hitung PBB",
                  color: Colors.green.shade900),
              const SizedBox(
                height: 15,
              ),
              if (pbbResult != null)
                Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "💵 PBB yang harus dibayar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Rp ${pbbResult!.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
