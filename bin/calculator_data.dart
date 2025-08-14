import 'dart:io';

void main() {
  calculatorData();
}

void calculatorData() {
  promptUser();
  double weeklyConsumption = readInput();

  double dailyAverage = calculateDailyAverage(weeklyConsumption);
  double monthlyEstimate = calculateMonthlyConsumption(dailyAverage);
  bool exceedsPlan = monthlyEstimate > 2048;
  int daysRemaining = calculateDaysRemaining(dailyAverage);

  printReport(dailyAverage, monthlyEstimate, exceedsPlan, daysRemaining);
}

void promptUser() {
  stdout.write('Ingresa la cantidad de datos consumidos en la semana (MB): ');
}

double readInput() {
  String? input = stdin.readLineSync();
  return double.parse(input!);
}

double calculateDailyAverage(double weeklyConsumption) {
  return weeklyConsumption / 7;
}

double calculateMonthlyConsumption(double dailyAverage) {
  const int daysInMonth = 30;
  return dailyAverage * daysInMonth;
}

int calculateDaysRemaining(double dailyAverage) {
  const double planLimitMB = 2048;
  return (planLimitMB / dailyAverage).floor();
}

void printReport(
  double dailyAverage,
  double monthlyEstimate,
  bool exceedsPlan,
  int daysRemaining,
) {
  print('Promedio diario: ${dailyAverage.toStringAsFixed(2)} MB');
  print(
    'Consumo mensual estimado: ${monthlyEstimate.toStringAsFixed(2)} MB',
  );

  if (exceedsPlan) {
    print('Advertencia: Excederás el plan de 2 GB (2048 MB).');
  } else {
    print('No excederás el plan de 2 GB.');
  }

  print('Días aproximados que durará el plan: $daysRemaining');
}
