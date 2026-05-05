
///enum übergibt ein paar Werte
///jeder Wert hat einen umrechnungsfaktor zu Millimeter über den Getter 
enum MeasurementSystem {
  mm, cm, dm, m, inch, feet;
  ///gibt den Umrechnungsfaktor im Millimeter zurück
  double get toMillimeter => switch (this) {
    MeasurementSystem.mm   => 1.0,
    MeasurementSystem.cm   => 10.0,
    MeasurementSystem.dm   => 100.0,
    MeasurementSystem.m    => 1000.0,
    MeasurementSystem.inch => 25.4,
    MeasurementSystem.feet => 304.8,
  };
}

///eine Klasse die Basis und Höhe des Dreiecks präsentiert
class Triangle {
  final double _baseInMm;       ///Basis in Millimeter
  final double _heightInMm;

  ///assert prüft ob Basis und Höhe größer als 0 sind
  Triangle._internal(this._baseInMm, this._heightInMm)
      : assert(_baseInMm > 0),
        assert(_heightInMm > 0);

  ///erstellt ein Dreieck mit der angegebenen Maßeinheit
  factory Triangle({
    required double base,
    required double height,
    required MeasurementSystem system,
  }) => Triangle._internal(base * system.toMillimeter, height * system.toMillimeter);

  ///erstellt ein Dreieck mit Werten in Millimeter 
  factory Triangle.fromMm(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.mm);
  ///erstellt ein Dreieck mit Werten in Zentimeter
  factory Triangle.fromCm(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.cm);

  factory Triangle.fromDm(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.dm);

  factory Triangle.fromM(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.m);

  factory Triangle.fromInch(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.inch);

  factory Triangle.fromFeet(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.feet);

  ///Gibt die Basis in der gewünschten [MeasurementSystem] zurück
  double baseIn(MeasurementSystem system) => _baseInMm / system.toMillimeter;
  double heightIn(MeasurementSystem system) => _heightInMm / system.toMillimeter;

  /// Berechnung: 0.5 * Basis * Höhe
  double get areaInMm2 => 0.5 * _baseInMm * _heightInMm;

 
 /// Gibt eine Textdarstellung des [Triangle] zurück
  @override
  String toString() => '''
 Triangle 
  Basis  : ${_baseInMm.toStringAsFixed(2)} mm / ${baseIn(MeasurementSystem.cm).toStringAsFixed(2)} cm / ${baseIn(MeasurementSystem.m).toStringAsFixed(4)} m
  Höhe   : ${_heightInMm.toStringAsFixed(2)} mm / ${heightIn(MeasurementSystem.cm).toStringAsFixed(2)} cm / ${heightIn(MeasurementSystem.m).toStringAsFixed(4)} m
  Fläche : ${areaInMm2.toStringAsFixed(2)} mm²
''';
}