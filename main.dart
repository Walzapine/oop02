import 'triangle.dart';

/// Einstiegspunkt der Anwendung
void main() {
  ///ERstellung verschiedener Dreiecke mit unterschiedlichen Maßeinheiten
  final t1 = Triangle.fromMm(30, 50);
  final t2 = Triangle.fromCm(3, 5);
  final t3 = Triangle.fromM(1.5, 2.0);
  final t4 = Triangle.fromInch(12, 8);
  final t5 = Triangle.fromFeet(2, 1.5);
  final t6 = Triangle(base: 5, height: 10, system: MeasurementSystem.cm);

  /// Gibt alle Dreiecke formatiert aus
  for (final t in [t1, t2, t3, t4, t5, t6]) {
    print(t);
  }
  /// Umrechnung einzelner Werte in andere Maßeinheiten und ausgabe in der Console
  print('t3 Basis in inch: ${t3.baseIn(MeasurementSystem.inch).toStringAsFixed(3)}');
  print('t4 Höhe in cm:    ${t4.heightIn(MeasurementSystem.cm).toStringAsFixed(3)}');
}