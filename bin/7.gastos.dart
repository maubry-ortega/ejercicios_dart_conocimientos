import 'dart:io';

void main() {
  List<Map<String, dynamic>> gastos = [];

  String opcion = '';
  do {
    print('\n--- Gestor de Gastos ---');
    print('1. Registrar gasto');
    print('2. Ver gastos por categoría');
    print('3. Ver gasto total');
    print('4. Salir');
    stdout.write('Seleccione una opción: ');
    opcion = stdin.readLineSync()!;

    switch (opcion) {
      case '1':
        registrarGasto(gastos);
        break;
      case '2':
        mostrarPorCategoria(gastos);
        break;
      case '3':
        mostrarTotal(gastos);
        break;
      case '4':
        print('Saliendo del gestor.');
        break;
      default:
        print('Opción inválida.');
    }
  } while (opcion != '4');
}

void registrarGasto(List<Map<String, dynamic>> gastos) {
  stdout.write('Categoría (comida, transporte, entretenimiento, servicios): ');
  String categoria = stdin.readLineSync()!;
  stdout.write('Monto: ');
  double monto = double.parse(stdin.readLineSync()!);

  gastos.add({'categoria': categoria, 'monto': monto});
  print('✅ Gasto registrado.');
}

void mostrarPorCategoria(List<Map<String, dynamic>> gastos) {
  Map<String, double> totales = {};

  for (var g in gastos) {
    totales[g['categoria']] = (totales[g['categoria']] ?? 0) + g['monto'];
  }

  print('\n--- Gastos por Categoría ---');
  totales.forEach((cat, total) {
    print('$cat: \$${total.toStringAsFixed(2)}');
  });
}

void mostrarTotal(List<Map<String, dynamic>> gastos) {
  double total = gastos.fold(0, (sum, g) => sum + g['monto']);
  print('\n💵 Gasto total del mes: \$${total.toStringAsFixed(2)}');
}
