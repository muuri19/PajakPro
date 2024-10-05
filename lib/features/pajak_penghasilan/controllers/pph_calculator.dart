// lib/services/pph_calculator.dart
import '../models/pph_calculation.dart';

PphCalculation hitungPph(double penghasilanBruto, double iuranPensiun, double ptkp) {
  double biayaJabatan = penghasilanBruto * 0.05;
  if (biayaJabatan > 6000000) {
    biayaJabatan = 6000000;
  }

  double pkp = penghasilanBruto - biayaJabatan - iuranPensiun - ptkp;
  if (pkp < 0) {
    pkp = 0;
  }

  double pphTerutang = 0;
  if (pkp <= 50000000) {
    pphTerutang = pkp * 0.05;
  } else if (pkp <= 250000000) {
    pphTerutang = (50000000 * 0.05) + ((pkp - 50000000) * 0.15);
  } else if (pkp <= 500000000) {
    pphTerutang = (50000000 * 0.05) + (200000000 * 0.15) + ((pkp - 250000000) * 0.25);
  } else {
    pphTerutang = (50000000 * 0.05) + (200000000 * 0.15) + (250000000 * 0.25) + ((pkp - 500000000) * 0.30);
  }

  return PphCalculation(
    penghasilanBruto: penghasilanBruto,
    biayaJabatan: biayaJabatan,
    iuranPensiun: iuranPensiun,
    ptkp: ptkp,
    pkp: pkp,
    pphTerutang: pphTerutang,
  );
}
