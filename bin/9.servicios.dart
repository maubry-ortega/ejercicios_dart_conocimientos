import 'dart:io';

class Servicio {
  String nombre;
  String direccion;
  double calificacion;

  Servicio(this.nombre, this.direccion, this.calificacion);
}

void main() {
  Map<String, List<Servicio>> servicios = {
    'restaurantes': [
      Servicio('La Pizzería', 'Calle 10 #5-20', 4.5),
      Servicio('Sushi Go', 'Carrera 15 #8-12', 4.8),
    ],
    'farmacias': [
      Servicio('Farmacia Central', 'Calle 20 #7-30', 4.2),
      Servicio('Drogas La Salud', 'Av. 3 #45-60', 4.6),
    ],
    'cajeros': [
      Servicio('Cajero Bancolombia', 'Calle 8 #12-14', 4.1),
      Servicio('Cajero Davivienda', 'Carrera 7 #20-22', 4.4),
    ],
  };

  stdout.write('Buscar servicio (restaurantes, farmacias, cajeros): ');
  String tipo = stdin.readLineSync()!.toLowerCase();

  if (!servicios.containsKey(tipo)) {
    print('❌ Tipo de servicio no disponible.');
    return;
  }

  List<Servicio> lista = servicios[tipo]!;
  lista.sort((a, b) => b.calificacion.compareTo(a.calificacion));

  print('\n--- $tipo disponibles ---');
  for (var s in lista) {
    print('${s.nombre} - ${s.direccion} ⭐${s.calificacion}');
  }
}
