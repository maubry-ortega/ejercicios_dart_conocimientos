import 'dart:io';

void main() {
  batteryCalculator();
}

void batteryCalculator() {
  promptUser();

  double batteryPercentage = readBatteryPercentage();
  double dailyUsageHours = readDailyUsage();

  double totalHoursRemaining = calculateRemainingHours(batteryPercentage, dailyUsageHours);

  print('\nHoras aproximadas que durará la batería: ${totalHoursRemaining.toStringAsFixed(2)} horas');

  applyPowerSavingModes(totalHoursRemaining);
}

void promptUser() {
  print('--- Calculadora de Batería Móvil ---');
  stdout.write('Ingrese el porcentaje actual de batería (0-100): ');
}

double readBatteryPercentage() {
  String? input = stdin.readLineSync();
  double percentage = double.parse(input!);

  if (percentage < 0 || percentage > 100) {
    print('Porcentaje inválido. Se ajustará a un rango válido (0-100).');
    percentage = percentage.clamp(0, 100);
  }
  return percentage;
}

double readDailyUsage() {
  stdout.write('Ingrese las horas de uso promedio diario: ');
  String? input = stdin.readLineSync();
  double dailyUsage = double.parse(input!);

  if (dailyUsage <= 0) {
    print('El uso debe ser mayor a 0. Se asignará valor mínimo de 1 hora.');
    dailyUsage = 1;
  }
  return dailyUsage;
}

double calculateRemainingHours(double batteryPercentage, double dailyUsageHours) {
  const double fullBatteryHours = 24; 
  double availableHours = (batteryPercentage / 100) * fullBatteryHours;
  return availableHours / (dailyUsageHours / 24);
}

void applyPowerSavingModes(double baseHours) {
  print('\n--- Modos de Ahorro de Energía ---');
  print('1. Modo Ahorro Básico (+20%)');
  print('2. Modo Ahorro Medio (+40%)');
  print('3. Modo Ultra Ahorro (+60%)');
  print('4. Sin ahorro');
  stdout.write('Seleccione un modo: ');

  String? option = stdin.readLineSync();
  double extendedHours = baseHours;

  switch (option) {
    case '1':
      extendedHours *= 1.2;
      print('Duración con Ahorro Básico: ${extendedHours.toStringAsFixed(2)} horas');
      break;
    case '2':
      extendedHours *= 1.4;
      print('Duración con Ahorro Medio: ${extendedHours.toStringAsFixed(2)} horas');
      break;
    case '3':
      extendedHours *= 1.6;
      print('Duración con Ultra Ahorro: ${extendedHours.toStringAsFixed(2)} horas');
      break;
    case '4':
      print('Sin ahorro aplicado. Duración normal: ${extendedHours.toStringAsFixed(2)} horas');
      break;
    default:
      print('Opción no válida. Se mantiene la duración normal: ${extendedHours.toStringAsFixed(2)} horas');
  }
}
