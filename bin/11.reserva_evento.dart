import 'dart:io';

void main() {
  runReservasEventos();
}

class Evento {
  String nombre;
  String fecha;
  String lugar;
  double precio;
  int capacidad;
  int reservados = 0;

  Evento(this.nombre, this.fecha, this.lugar, this.precio, this.capacidad);

  bool reservar(int cantidad) {
    if (reservados + cantidad <= capacidad) {
      reservados += cantidad;
      return true;
    }
    return false;
  }

  void cancelar(int cantidad) {
    reservados = (reservados - cantidad < 0) ? 0 : reservados - cantidad;
  }

  int disponibles() => capacidad - reservados;
}

void runReservasEventos() {
  List<Evento> eventos = [
    Evento("Concierto Rock", "2025-09-15", "Teatro Mayor", 80.0, 100),
    Evento("Obra Teatro", "2025-09-20", "Sala Nacional", 50.0, 60),
    Evento("Cine Estreno", "2025-09-10", "Cine Central", 20.0, 120),
  ];

  while (true) {
    print("\n--- Sistema de Reservas ---");
    print("1. Ver eventos");
    print("2. Reservar");
    print("3. Cancelar reserva");
    print("4. Salir");
    stdout.write("Opción: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        mostrarEventos(eventos);
        break;
      case "2":
        reservarEvento(eventos);
        break;
      case "3":
        cancelarReserva(eventos);
        break;
      case "4":
        print("👋 Saliendo del sistema...");
        return;
      default:
        print("❌ Opción inválida.");
    }
  }
}

void mostrarEventos(List<Evento> eventos) {
  print("\n--- Eventos Disponibles ---");
  for (int i = 0; i < eventos.length; i++) {
    Evento e = eventos[i];
    print(
        "${i + 1}. ${e.nombre} - ${e.fecha} en ${e.lugar} | Precio: \$${e.precio} | Disponibles: ${e.disponibles()}");
  }
}

void reservarEvento(List<Evento> eventos) {
  mostrarEventos(eventos);
  stdout.write("Seleccione el número de evento: ");
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index == null || index < 1 || index > eventos.length) {
    print("❌ Evento inválido.");
    return;
  }
  stdout.write("Ingrese cantidad de boletos: ");
  int? cantidad = int.tryParse(stdin.readLineSync() ?? '');
  if (cantidad == null || cantidad <= 0) {
    print("❌ Cantidad inválida.");
    return;
  }
  if (eventos[index - 1].reservar(cantidad)) {
    print("✅ Reserva exitosa.");
  } else {
    print("❌ No hay suficientes cupos.");
  }
}

void cancelarReserva(List<Evento> eventos) {
  mostrarEventos(eventos);
  stdout.write("Seleccione el número de evento: ");
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index == null || index < 1 || index > eventos.length) {
    print("❌ Evento inválido.");
    return;
  }
  stdout.write("Ingrese cantidad a cancelar: ");
  int? cantidad = int.tryParse(stdin.readLineSync() ?? '');
  if (cantidad == null || cantidad <= 0) {
    print("❌ Cantidad inválida.");
    return;
  }
  eventos[index - 1].cancelar(cantidad);
  print("✅ Cancelación realizada.");
}
