import 'dart:io';

class Estudiante {
  String nombre;
  String id;
  List<double> notas;

  Estudiante(this.nombre, this.id) : notas = [];

  void agregarNota(double nota) {
    notas.add(nota);
  }

  double promedio() {
    if (notas.isEmpty) return 0;
    return notas.reduce((a, b) => a + b) / notas.length;
  }

  bool aprobo() => promedio() >= 3.0;

  void reporte() {
    print('\nEstudiante: $nombre (ID: $id)');
    print('Notas: $notas');
    print('Promedio: ${promedio().toStringAsFixed(2)}');
    print(aprobo() ? '✅ Aprobó' : '❌ Reprobó');
  }
}

void main() {
  List<Estudiante> estudiantes = [];

  String opcion = '';
  do {
    print('\n--- Sistema de Calificaciones ---');
    print('1. Registrar estudiante');
    print('2. Agregar nota');
    print('3. Ver reporte de estudiante');
    print('4. Estadísticas del grupo');
    print('5. Salir');
    stdout.write('Opción: ');
    opcion = stdin.readLineSync()!;

    switch (opcion) {
      case '1':
        estudiantes.add(registrarEstudiante());
        break;
      case '2':
        agregarNotaEstudiante(estudiantes);
        break;
      case '3':
        mostrarReporte(estudiantes);
        break;
      case '4':
        estadisticasGrupo(estudiantes);
        break;
    }
  } while (opcion != '5');
}

Estudiante registrarEstudiante() {
  stdout.write('Nombre: ');
  String nombre = stdin.readLineSync()!;
  stdout.write('ID: ');
  String id = stdin.readLineSync()!;
  return Estudiante(nombre, id);
}

void agregarNotaEstudiante(List<Estudiante> lista) {
  stdout.write('ID del estudiante: ');
  String id = stdin.readLineSync()!;
  Estudiante? est = lista.firstWhere((e) => e.id == id, orElse: () => Estudiante('', ''));

  if (est.nombre.isEmpty) {
    print('❌ Estudiante no encontrado.');
    return;
  }

  stdout.write('Nota: ');
  double nota = double.parse(stdin.readLineSync()!);
  est.agregarNota(nota);
  print('✅ Nota agregada.');
}

void mostrarReporte(List<Estudiante> lista) {
  stdout.write('ID del estudiante: ');
  String id = stdin.readLineSync()!;
  Estudiante? est = lista.firstWhere((e) => e.id == id, orElse: () => Estudiante('', ''));

  if (est.nombre.isEmpty) {
    print('❌ Estudiante no encontrado.');
  } else {
    est.reporte();
  }
}

void estadisticasGrupo(List<Estudiante> lista) {
  if (lista.isEmpty) {
    print('No hay estudiantes registrados.');
    return;
  }

  double promedioGrupo = lista.map((e) => e.promedio()).reduce((a, b) => a + b) / lista.length;
  print('\n📊 Promedio del grupo: ${promedioGrupo.toStringAsFixed(2)}');
}