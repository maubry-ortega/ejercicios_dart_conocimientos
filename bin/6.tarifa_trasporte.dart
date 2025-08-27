import 'dart:io';

class Transporte {
  String nombre;
  double tarifaBase;
  double costoPorKm;

  Transporte(this.nombre, this.tarifaBase, this.costoPorKm);

  double calcularCosto(double distancia) {
    return tarifaBase + (costoPorKm * distancia);
  }
}

class Bus extends Transporte {
  Bus() : super('Bus', 1500, 200);
}

class Metro extends Transporte {
  Metro() : super('Metro', 2000, 150);
}

class Taxi extends Transporte {
  Taxi() : super('Taxi', 4000, 1000);
}

class AppMovil extends Transporte {
  AppMovil() : super('App Móvil', 3500, 800);
}

void main() {
  List<Transporte> transportes = [Bus(), Metro(), Taxi(), AppMovil()];

  stdout.write('Ingrese distancia recorrida en km: ');
  double distancia = double.parse(stdin.readLineSync()!);

  print('\n--- Costo del viaje ---');
  for (var t in transportes) {
    print('${t.nombre}: \$${t.calcularCosto(distancia).toStringAsFixed(0)}');
  }
}
