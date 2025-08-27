import 'dart:io';

class PlanDatos {
  String nombre;
  double gbIncluidos;
  double costoMensual;
  double costoExtraGB;

  PlanDatos(this.nombre, this.gbIncluidos, this.costoMensual, this.costoExtraGB);

  double calcularCosto(double consumoGB) {
    if (consumoGB <= gbIncluidos) return costoMensual;
    double extra = consumoGB - gbIncluidos;
    return costoMensual + (extra * costoExtraGB);
  }
}

void main() {
  List<PlanDatos> planes = [
    PlanDatos('Básico', 5, 20000, 3000),
    PlanDatos('Estándar', 10, 35000, 2500),
    PlanDatos('Premium', 20, 50000, 2000),
  ];

  stdout.write('Ingrese su consumo mensual promedio (GB): ');
  double consumo = double.parse(stdin.readLineSync()!);

  PlanDatos mejor = planes[0];
  double mejorCosto = mejor.calcularCosto(consumo);

  for (var p in planes) {
    double costo = p.calcularCosto(consumo);
    print('${p.nombre}: \$${costo.toStringAsFixed(0)}');
    if (costo < mejorCosto) {
      mejor = p;
      mejorCosto = costo;
    }
  }

  print('\n📌 El plan más económico para usted es: ${mejor.nombre} (\$${mejorCosto.toStringAsFixed(0)})');
}
