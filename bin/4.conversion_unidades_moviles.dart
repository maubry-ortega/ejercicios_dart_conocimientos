import 'dart:io';

void main() {
  unitConverter();
}

void unitConverter() {
  String choice = '';

  do {
    print('\n--- Conversor de Unidades ---');
    print('1. Temperatura (Celsius ↔ Fahrenheit)');
    print('2. Distancia (Metros ↔ Kilómetros ↔ Millas)');
    print('3. Peso (Gramos ↔ Kilogramos ↔ Libras)');
    print('4. Almacenamiento (KB ↔ MB ↔ GB)');
    print('5. Salir');
    stdout.write('Seleccione una opción: ');
    choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        convertTemperature();
        break;
      case '2':
        convertDistance();
        break;
      case '3':
        convertWeight();
        break;
      case '4':
        convertStorage();
        break;
      case '5':
        print('Saliendo del conversor.');
        break;
      default:
        print('Opción no válida. Intente de nuevo.');
    }
  } while (choice != '5');
}

// ================= TEMPERATURA =================
void convertTemperature() {
  print('\n--- Conversor de Temperatura ---');
  stdout.write('Ingrese el valor: ');
  double value = double.parse(stdin.readLineSync()!);

  stdout.write('¿Está en Celsius (C) o Fahrenheit (F)? ');
  String unit = stdin.readLineSync()!.toUpperCase();

  if (unit == 'C') {
    double fahrenheit = (value * 9 / 5) + 32;
    print('$value °C = ${fahrenheit.toStringAsFixed(2)} °F');
  } else if (unit == 'F') {
    double celsius = (value - 32) * 5 / 9;
    print('$value °F = ${celsius.toStringAsFixed(2)} °C');
  } else {
    print('Unidad inválida.');
  }
}

// ================= DISTANCIA =================
void convertDistance() {
  print('\n--- Conversor de Distancia ---');
  stdout.write('Ingrese el valor: ');
  double value = double.parse(stdin.readLineSync()!);

  stdout.write('Unidad actual (m/km/mi): ');
  String unit = stdin.readLineSync()!.toLowerCase();

  switch (unit) {
    case 'm':
      print('$value m = ${(value / 1000).toStringAsFixed(3)} km');
      print('$value m = ${(value / 1609.34).toStringAsFixed(3)} mi');
      break;
    case 'km':
      print('$value km = ${(value * 1000).toStringAsFixed(3)} m');
      print('$value km = ${(value / 1.609).toStringAsFixed(3)} mi');
      break;
    case 'mi':
      print('$value mi = ${(value * 1609.34).toStringAsFixed(3)} m');
      print('$value mi = ${(value * 1.609).toStringAsFixed(3)} km');
      break;
    default:
      print('Unidad inválida.');
  }
}

// ================= PESO =================
void convertWeight() {
  print('\n--- Conversor de Peso ---');
  stdout.write('Ingrese el valor: ');
  double value = double.parse(stdin.readLineSync()!);

  stdout.write('Unidad actual (g/kg/lb): ');
  String unit = stdin.readLineSync()!.toLowerCase();

  switch (unit) {
    case 'g':
      print('$value g = ${(value / 1000).toStringAsFixed(3)} kg');
      print('$value g = ${(value / 453.592).toStringAsFixed(3)} lb');
      break;
    case 'kg':
      print('$value kg = ${(value * 1000).toStringAsFixed(3)} g');
      print('$value kg = ${(value * 2.205).toStringAsFixed(3)} lb');
      break;
    case 'lb':
      print('$value lb = ${(value * 453.592).toStringAsFixed(3)} g');
      print('$value lb = ${(value / 2.205).toStringAsFixed(3)} kg');
      break;
    default:
      print('Unidad inválida.');
  }
}

// ================= ALMACENAMIENTO =================
void convertStorage() {
  print('\n--- Conversor de Almacenamiento ---');
  stdout.write('Ingrese el valor: ');
  double value = double.parse(stdin.readLineSync()!);

  stdout.write('Unidad actual (KB/MB/GB): ');
  String unit = stdin.readLineSync()!.toUpperCase();

  switch (unit) {
    case 'KB':
      print('$value KB = ${(value / 1024).toStringAsFixed(3)} MB');
      print('$value KB = ${(value / (1024 * 1024)).toStringAsFixed(6)} GB');
      break;
    case 'MB':
      print('$value MB = ${(value * 1024).toStringAsFixed(3)} KB');
      print('$value MB = ${(value / 1024).toStringAsFixed(3)} GB');
      break;
    case 'GB':
      print('$value GB = ${(value * 1024).toStringAsFixed(3)} MB');
      print('$value GB = ${(value * 1024 * 1024).toStringAsFixed(3)} KB');
      break;
    default:
      print('Unidad inválida.');
  }
}
