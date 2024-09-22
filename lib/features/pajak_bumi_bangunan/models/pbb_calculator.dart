class PBBCalculator {
  final double njop;
  final double njoptkp;
  final double taxRate;

  PBBCalculator({
    required this.njop,
    this.njoptkp = 10000000, // Default NJOPTKP 10 juta
    this.taxRate = 0.002, // Tarif pajak 0.2%
  });

  double calculatePBB() {
    double taxableAmount = njop - njoptkp;
    if (taxableAmount < 0) {
      taxableAmount = 0;
    }
    return taxableAmount * taxRate;
  }
}
