import 'dart:io';

void main() {
  runEntregasDomicilio();
}

class Cliente {
  String nombre;
  String direccion;
  String telefono;

  Cliente(this.nombre, this.direccion, this.telefono);
}

class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);
}

class Pedido {
  Cliente cliente;
  List<Producto> productos;
  double costoDomicilio;
  int tiempoEntrega; // minutos

  Pedido(this.cliente, this.productos, this.costoDomicilio, this.tiempoEntrega);

  double total() {
    double subtotal = productos.fold(0, (sum, p) => sum + p.precio);
    return subtotal + costoDomicilio;
  }
}

void runEntregasDomicilio() {
  List<Producto> catalogo = [
    Producto("Pizza", 30),
    Producto("Hamburguesa", 15),
    Producto("Gaseosa", 5),
  ];

  print("--- Sistema de Entregas ---");
  stdout.write("Ingrese nombre: ");
  String nombre = stdin.readLineSync()!;
  stdout.write("Ingrese dirección: ");
  String direccion = stdin.readLineSync()!;
  stdout.write("Ingrese teléfono: ");
  String telefono = stdin.readLineSync()!;
  Cliente cliente = Cliente(nombre, direccion, telefono);

  List<Producto> seleccionados = [];
  while (true) {
    print("\n--- Catálogo ---");
    for (int i = 0; i < catalogo.length; i++) {
      print("${i + 1}. ${catalogo[i].nombre} - \$${catalogo[i].precio}");
    }
    print("${catalogo.length + 1}. Finalizar pedido");
    stdout.write("Opción: ");
    int? opcion = int.tryParse(stdin.readLineSync() ?? '');
    if (opcion == null || opcion < 1 || opcion > catalogo.length + 1) {
      print("❌ Opción inválida.");
      continue;
    }
    if (opcion == catalogo.length + 1) break;
    seleccionados.add(catalogo[opcion - 1]);
    print("✅ Producto agregado.");
  }

  Pedido pedido = Pedido(cliente, seleccionados, 5.0, 30);
  print("\n--- Resumen del Pedido ---");
  print("Cliente: ${cliente.nombre}, ${cliente.direccion}, ${cliente.telefono}");
  for (var p in seleccionados) {
    print("- ${p.nombre} \$${p.precio}");
  }
  print("Costo domicilio: \$${pedido.costoDomicilio}");
  print("Tiempo estimado: ${pedido.tiempoEntrega} min");
  print("Total a pagar: \$${pedido.total()}");
}
