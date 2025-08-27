import 'dart:io';

void main() {
  runRedSocial();
}

class UsuarioMovil {
  String nombre;
  String bio;
  int seguidores;
  int publicaciones;
  DateTime fechaRegistro;

  UsuarioMovil(this.nombre, this.bio)
      : seguidores = 0,
        publicaciones = 0,
        fechaRegistro = DateTime.now();

  void actualizarBio(String nuevaBio) {
    bio = nuevaBio;
  }

  void nuevoSeguidor() {
    seguidores++;
  }

  void nuevaPublicacion() {
    publicaciones++;
  }

  void mostrarPerfil() {
    print("\n--- Perfil de Usuario ---");
    print("Nombre: $nombre");
    print("Biografía: $bio");
    print("Seguidores: $seguidores");
    print("Publicaciones: $publicaciones");
    print("Registrado el: ${fechaRegistro.toLocal()}");
  }
}

void runRedSocial() {
  stdout.write("Ingrese nombre de usuario: ");
  String nombre = stdin.readLineSync()!;
  stdout.write("Ingrese biografía: ");
  String bio = stdin.readLineSync()!;
  UsuarioMovil user = UsuarioMovil(nombre, bio);

  while (true) {
    print("\n--- Red Social Básica ---");
    print("1. Ver perfil");
    print("2. Actualizar bio");
    print("3. Nuevo seguidor");
    print("4. Nueva publicación");
    print("5. Salir");
    stdout.write("Opción: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        user.mostrarPerfil();
        break;
      case "2":
        stdout.write("Ingrese nueva bio: ");
        user.actualizarBio(stdin.readLineSync()!);
        print("✅ Bio actualizada.");
        break;
      case "3":
        user.nuevoSeguidor();
        print("✅ Nuevo seguidor agregado.");
        break;
      case "4":
        user.nuevaPublicacion();
        print("✅ Nueva publicación registrada.");
        break;
      case "5":
        print("👋 Cerrando sesión...");
        return;
      default:
        print("❌ Opción inválida.");
    }
  }
}
