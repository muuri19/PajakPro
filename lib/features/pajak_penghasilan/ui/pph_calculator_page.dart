// lib/screens/pph_calculator_page.dart
import 'package:flutter/material.dart';
import '../services/pph_calculator.dart';
import '../models/pph_calculation.dart';

class PphCalculatorPage extends StatefulWidget {
  static const routeName = 'pajak-penghasilan';
  const PphCalculatorPage({super.key});

  @override
  _PphCalculatorPageState createState() => _PphCalculatorPageState();
}

class _PphCalculatorPageState extends State<PphCalculatorPage> {
  final _penghasilanController = TextEditingController();
  final _iuranPensiunController = TextEditingController();
  final _ptkpController = TextEditingController();
  PphCalculation? _result;

  void _calculatePph() {
    final penghasilanBruto = double.tryParse(_penghasilanController.text) ?? 0;
    final iuranPensiun = double.tryParse(_iuranPensiunController.text) ?? 0;
    final ptkp = double.tryParse(_ptkpController.text) ?? 0;

    setState(() {
      _result = hitungPph(penghasilanBruto, iuranPensiun, ptkp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          "Pajak Penghasilan (PPh)",
          style: TextStyle(color: Colors.white),
        ),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _penghasilanController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: "Penghasilan Bruto",
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.green.shade900, width: 2)),
                    suffixText: "Rupiah"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _iuranPensiunController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: "Iuran Pensiun",
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.green.shade900, width: 2)),
                    suffixText: "Rupiah"),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _ptkpController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    labelText: "PTKP",
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: Colors.green.shade900, width: 2)),
                    suffixText: "Rupiah"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _calculatePph,
                child: const Text(
                  "Hitung PPh",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              if (_result != null) ...[
                Card(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "💵 Penghasilan Kena Pajak (PKP)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Rp ${_result!.pkp}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "📊 PPh Terutang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Rp ${_result!.pphTerutang}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
