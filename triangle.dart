enum MeasurementSystem {
  mm, cm, dm, m, inch, feet;

  double get toMillimeter => switch (this) {
    MeasurementSystem.mm   => 1.0,
    MeasurementSystem.cm   => 10.0,
    MeasurementSystem.dm   => 100.0,
    MeasurementSystem.m    => 1000.0,
    MeasurementSystem.inch => 25.4,
    MeasurementSystem.feet => 304.8,
  };
}

class Triangle {
  final double _baseInMm;
  final double _heightInMm;

  
  Triangle._internal(this._baseInMm, this._heightInMm)
      : assert(_baseInMm > 0),
        assert(_heightInMm > 0);


  factory Triangle({
    required double base,
    required double height,
    required MeasurementSystem system,
  }) => Triangle._internal(base * system.toMillimeter, height * system.toMillimeter);

  factory Triangle.fromMm(double base, double height) =>
      Triangle(base: base, height: height, system: MeasurementSystem.mm);

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

  double baseIn(MeasurementSystem system) => _baseInMm / system.toMillimeter;
  double heightIn(MeasurementSystem system) => _heightInMm / system.toMillimeter;

  double get areaInMm2 => 0.5 * _baseInMm * _heightInMm;

  @override
  String toString() => '''
 Triangle 
  Basis  : ${_baseInMm.toStringAsFixed(2)} mm / ${baseIn(MeasurementSystem.cm).toStringAsFixed(2)} cm / ${baseIn(MeasurementSystem.m).toStringAsFixed(4)} m
  Höhe   : ${_heightInMm.toStringAsFixed(2)} mm / ${heightIn(MeasurementSystem.cm).toStringAsFixed(2)} cm / ${heightIn(MeasurementSystem.m).toStringAsFixed(4)} m
  Fläche : ${areaInMm2.toStringAsFixed(2)} mm²
''';
}