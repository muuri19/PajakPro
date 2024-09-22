class VehicleTax {
  final double njkb; // Nilai Jual Kendaraan Bermotor
  final double tariff; // Tarif PKB (biasanya 2% untuk kendaraan pribadi)

  VehicleTax({required this.njkb, this.tariff = 0.02});

  double calculatePKB() {
    return njkb * tariff;
  }
}
