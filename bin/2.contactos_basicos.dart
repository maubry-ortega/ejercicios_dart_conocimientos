import 'dart:io';

void main() {
  List<Map<String, String>> contacts = [];

  do {
    print('Agregar nuevo contacto (${contacts.length + 1}/5)');

    stdout.write('Nombre: ');
    String name = stdin.readLineSync()!;

    stdout.write('Teléfono: ');
    String phone = stdin.readLineSync()!;

    stdout.write('Email: ');
    String email = stdin.readLineSync()!;

    contacts.add({'name': name, 'phone': phone, 'email': email});

    if (contacts.length < 5) {
      stdout.write('¿Deseas agregar otro contacto? (s/n): ');
      String? option = stdin.readLineSync();
      if (option == null || option.toLowerCase() != 's') {
        break;
      }
    }
  } while (contacts.length < 5);

  // Menú principal
  String choice = '';
  do {
    print('--- Menú de Contactos ---');
    print('1. Ver todos los contactos');
    print('2. Buscar contacto por nombre');
    print('3. Mostrar cantidad de contactos');
    print('4. Salir');
    stdout.write('Selecciona una opción: ');
    choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        showAllContacts(contacts);
        break;
      case '2':
        searchContactByName(contacts);
        break;
      case '3':
        print('Total de contactos registrados: ${contacts.length}');
        break;
      case '4':
        print('Saliendo del gestor de contactos.');
        break;
      default:
        print('Opción no válida. Intenta nuevamente.');
    }
  } while (choice != '4');
}

void showAllContacts(List<Map<String, String>> contacts) {
  if (contacts.isEmpty) {
    print('No hay contactos registrados.');
    return;
  }

  print('Lista de Contactos:');
  for (int i = 0; i < contacts.length; i++) {
    final contact = contacts[i];
    print('\nContacto ${i + 1}:');
    print('Nombre : ${contact['name']}');
    print('Teléfono : ${contact['phone']}');
    print('Email : ${contact['email']}');
  }
}

void searchContactByName(List<Map<String, String>> contacts) {
  stdout.write('Ingresa el nombre a buscar: ');
  String nameToSearch = stdin.readLineSync()!.toLowerCase();

  final found =
      contacts.where((c) => c['name']!.toLowerCase() == nameToSearch).toList();

  if (found.isEmpty) {
    print('Contacto no encontrado.');
  } else {
    print('\nContacto encontrado:');
    for (final contact in found) {
      print('Nombre : ${contact['name']}');
      print('Teléfono : ${contact['phone']}');
      print('Email : ${contact['email']}');
    }
  }
}
