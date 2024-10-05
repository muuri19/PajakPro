import 'package:flutter/material.dart';
import 'package:pajakpro/features/pajak_kendaraan_bermotor/models/pkb_calculator.dart';
import 'package:pajakpro/widgets/button_calculate.dart';
import 'package:pajakpro/widgets/custom_appbar.dart';
import 'package:pajakpro/widgets/custom_textfield.dart';

class PkbCalculatorPage extends StatefulWidget {
  static const routeName = 'Pajak-Kendaraan-Bermotor';

  const PkbCalculatorPage({super.key});
  @override
  _PkbCalculatorPageState createState() => _PkbCalculatorPageState();
}

class _PkbCalculatorPageState extends State<PkbCalculatorPage> {
  final TextEditingController _njkbController = TextEditingController();
  double _result = 0.0;

  void _calculateTax() {
    double njkb = double.tryParse(_njkbController.text) ?? 0.0;
    VehicleTax vehicleTax = VehicleTax(njkb: njkb);
    setState(() {
      _result = vehicleTax.calculatePKB();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Pajak Kendaraan Bermotor", panduanPajak: 'Pajak Kendaraan Bermotor',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextfield(
                controller: _njkbController,
                labelText: "Nilai Jual Kendaraan Bermotor (NJKB)", validator: (value) {  },),
            const SizedBox(height: 20),
            ButtonCalculate(
                onPressed: _calculateTax,
                text: "Hitung Pajak",
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
                        "💵 Pajak Kendaraan Bermotor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Rp $_result',
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
