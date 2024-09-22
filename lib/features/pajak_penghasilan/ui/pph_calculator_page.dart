import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';
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

  void _resetInput() {
    _penghasilanController.clear();
    _iuranPensiunController.clear();
    _ptkpController.clear();
    setState(() {
      _result = PphCalculation(
          pkp: 0,
          pphTerutang: 0,
          penghasilanBruto: 0,
          biayaJabatan: 0,
          iuranPensiun: 0,
          ptkp: 0);
    });
  }

  @override
  void initState() {
    super.initState();

    _result = PphCalculation(
        pkp: 0,
        pphTerutang: 0,
        penghasilanBruto: 0,
        biayaJabatan: 0,
        iuranPensiun: 0,
        ptkp: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: const CustomAppBar(title: "Pajak Penghasilan (PPh)"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextfield(
                  controller: _penghasilanController,
                  labelText: "Penghasilan Bruto"),
              const SizedBox(height: 12),
              CustomTextfield(
                  controller: _iuranPensiunController,
                  labelText: "Iuran Pensiun"),
              const SizedBox(height: 12),
              CustomTextfield(controller: _ptkpController, labelText: "PTKP"),
              const SizedBox(height: 20),
              ButtonCalculate(
                onPressed: _calculatePph,
                text: "Hitung PPh",
                color: Colors.green.shade900,
              ),
              const SizedBox(height: 10),
              ButtonCalculate(
                  onPressed: _resetInput, text: "Reset", color: Colors.red),
              const SizedBox(height: 20),
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
                        const SizedBox(height: 3),
                        Text(
                          "Rp ${_result!.pkp}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "📊 PPh Terutang",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Rp ${_result!.pphTerutang}",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
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
    );
  }
}
