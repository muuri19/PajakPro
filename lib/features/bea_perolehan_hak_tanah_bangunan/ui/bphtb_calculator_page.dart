import 'package:flutter/material.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';

class BphtbCalculatorPage extends StatefulWidget {
  static const routeName = 'Bea-Tanah-Bangunan';
  const BphtbCalculatorPage({super.key});

  @override
  _BphtbCalculatorPageState createState() => _BphtbCalculatorPageState();
}

class _BphtbCalculatorPageState extends State<BphtbCalculatorPage> {
  final TextEditingController _npopController = TextEditingController();
  final TextEditingController _npoptkpController = TextEditingController();
  double _result = 0;

  void _calculateBPHTB() {
    double npop = double.parse(_npopController.text);
    double npoptkp = double.parse(_npoptkpController.text);

    if (npop > npoptkp) {
      _result = (npop - npoptkp) * 0.05;
    } else {
      _result = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "BPHTB",
        panduanPajak: 'Nilai Perolehan Objek Pajak (NPOP)',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
              controller: _npopController,
              labelText: "Nilai Perolehan Objek Pajak (NPOP)",
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextfield(
              controller: _npoptkpController,
              labelText: "NPOPTKP",
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(height: 20),
            ButtonCalculate(
                onPressed: _calculateBPHTB,
                text: "Hitung BPHTB",
                color: Colors.green.shade900),
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
                        "💵 BPHTB",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Rp ${_result.toStringAsFixed(2)}',
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
    );
  }
}
