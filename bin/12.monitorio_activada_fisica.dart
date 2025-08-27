import 'dart:io';

void main() {
  runMonitorActividad();
}

abstract class Actividad {
  String nombre;
  int duracion; // minutos
  double caloriasPorMinuto;
  double distanciaPorMinuto;

  Actividad(this.nombre, this.duracion, this.caloriasPorMinuto, this.distanciaPorMinuto);

  double caloriasTotales() => duracion * caloriasPorMinuto;
  double distanciaTotal() => duracion * distanciaPorMinuto;
}

class Caminar extends Actividad {
  Caminar(int duracion) : super("Caminar", duracion, 4.0, 0.07);
}

class Correr extends Actividad {
  Correr(int duracion) : super("Correr", duracion, 10.0, 0.15);
}

class Bicicleta extends Actividad {
  Bicicleta(int duracion) : super("Bicicleta", duracion, 8.0, 0.2);
}

void runMonitorActividad() {
  List<Actividad> actividades = [];
  while (true) {
    print("\n--- Monitor de Actividad Física ---");
    print("1. Registrar caminar");
    print("2. Registrar correr");
    print("3. Registrar bicicleta");
    print("4. Ver estadísticas");
    print("5. Salir");
    stdout.write("Opción: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        actividades.add(Caminar(readDuracion()));
        print("✅ Caminar registrado.");
        break;
      case "2":
        actividades.add(Correr(readDuracion()));
        print("✅ Correr registrado.");
        break;
      case "3":
        actividades.add(Bicicleta(readDuracion()));
        print("✅ Bicicleta registrada.");
        break;
      case "4":
        mostrarEstadisticas(actividades);
        break;
      case "5":
        print("👋 Saliendo...");
        return;
      default:
        print("❌ Opción inválida.");
    }
  }
}

int readDuracion() {
  stdout.write("Ingrese duración en minutos: ");
  int? duracion = int.tryParse(stdin.readLineSync() ?? '');
  while (duracion == null || duracion <= 0) {
    print("❌ Duración inválida.");
    stdout.write("Ingrese duración en minutos: ");
    duracion = int.tryParse(stdin.readLineSync() ?? '');
  }
  return duracion;
}

void mostrarEstadisticas(List<Actividad> actividades) {
  double totalCalorias = 0;
  double totalDistancia = 0;
  for (var a in actividades) {
    totalCalorias += a.caloriasTotales();
    totalDistancia += a.distanciaTotal();
  }
  print("\n📊 Estadísticas Semanales:");
  print("Total actividades: ${actividades.length}");
  print("Total calorías: ${totalCalorias.toStringAsFixed(2)}");
  print("Total distancia: ${totalDistancia.toStringAsFixed(2)} km");
}
