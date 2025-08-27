import 'dart:io';

void main() {
  userRegistration();
}

void userRegistration() {
  print('--- Registro de Usuario ---');

  String username = readUsername();
  String password = readPassword();
  String email = readEmail();
  int age = readAge();
  String phone = readPhone();

  print('\n✅ Registro exitoso:');
  print('Nombre de usuario: $username');
  print('Email: $email');
  print('Edad: $age');
  print('Teléfono: $phone');
}

// ================= USERNAME =================
String readUsername() {
  stdout.write('Ingrese nombre de usuario: ');
  String input = stdin.readLineSync()!;
  while (input.isEmpty) {
    print('❌ El nombre de usuario no puede estar vacío.');
    stdout.write('Ingrese nombre de usuario: ');
    input = stdin.readLineSync()!;
  }
  return input;
}

// ================= PASSWORD =================
String readPassword() {
  stdout.write('Ingrese contraseña (mínimo 8 caracteres): ');
  String input = stdin.readLineSync()!;
  while (input.length < 8) {
    print('❌ La contraseña debe tener al menos 8 caracteres.');
    stdout.write('Ingrese contraseña: ');
    input = stdin.readLineSync()!;
  }
  return input;
}

// ================= EMAIL =================
String readEmail() {
  stdout.write('Ingrese email: ');
  String input = stdin.readLineSync()!;
  while (!input.contains('@') || input.length < 5) {
    print('❌ Email inválido. Debe contener "@" y tener formato válido.');
    stdout.write('Ingrese email: ');
    input = stdin.readLineSync()!;
  }
  return input;
}

// ================= AGE =================
int readAge() {
  stdout.write('Ingrese edad: ');
  String? input = stdin.readLineSync();
  int? age = int.tryParse(input ?? '');
  while (age == null || age <= 13) {
    print('❌ Edad inválida. Debe ser mayor de 13 años.');
    stdout.write('Ingrese edad: ');
    input = stdin.readLineSync();
    age = int.tryParse(input ?? '');
  }
  return age;
}

// ================= PHONE =================
String readPhone() {
  stdout.write('Ingrese número de teléfono (10 dígitos): ');
  String input = stdin.readLineSync()!;
  while (input.length != 10 || int.tryParse(input) == null) {
    print('❌ Número inválido. Debe contener exactamente 10 dígitos numéricos.');
    stdout.write('Ingrese número de teléfono: ');
    input = stdin.readLineSync()!;
  }
  return input;
}
