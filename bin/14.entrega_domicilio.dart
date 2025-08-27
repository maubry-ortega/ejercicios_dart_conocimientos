import 'dart:io';

void main() {
  runCarritoCompras();
}

class Producto {
  String nombre;
  double precio;
  String categoria;
  bool disponible;

  Producto(this.nombre, this.precio, this.categoria, this.disponible);
}

void runCarritoCompras() {
  List<Producto> catalogo = [
    Producto("Laptop", 1200, "Tecnología", true),
    Producto("Auriculares", 50, "Accesorios", true),
    Producto("Camiseta", 25, "Ropa", true),
    Producto("Zapatos", 80, "Ropa", false),
  ];

  List<Producto> carrito = [];

  while (true) {
    print("\n--- Carrito de Compras ---");
    print("1. Ver catálogo");
    print("2. Agregar producto");
    print("3. Ver carrito y total");
    print("4. Salir");
    stdout.write("Opción: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case "1":
        mostrarCatalogo(catalogo);
        break;
      case "2":
        agregarProducto(catalogo, carrito);
        break;
      case "3":
        mostrarCarrito(carrito);
        break;
      case "4":
        print("👋 Saliendo...");
        return;
      default:
        print("❌ Opción inválida.");
    }
  }
}

void mostrarCatalogo(List<Producto> catalogo) {
  print("\n--- Catálogo ---");
  for (int i = 0; i < catalogo.length; i++) {
    var p = catalogo[i];
    print("${i + 1}. ${p.nombre} - \$${p.precio} (${p.categoria}) [${p.disponible ? "Disponible" : "No disponible"}]");
  }
}

void agregarProducto(List<Producto> catalogo, List<Producto> carrito) {
  mostrarCatalogo(catalogo);
  stdout.write("Seleccione el número de producto: ");
  int? index = int.tryParse(stdin.readLineSync() ?? '');
  if (index == null || index < 1 || index > catalogo.length) {
    print("❌ Producto inválido.");
    return;
  }
  Producto p = catalogo[index - 1];
  if (!p.disponible) {
    print("❌ Producto no disponible.");
    return;
  }
  carrito.add(p);
  print("✅ Producto agregado.");
}

void mostrarCarrito(List<Producto> carrito) {
  if (carrito.isEmpty) {
    print("🛒 Carrito vacío.");
    return;
  }
  double subtotal = carrito.fold(0, (sum, p) => sum + p.precio);
  double descuento = subtotal > 100 ? subtotal * 0.1 : 0;
  double impuestos = (subtotal - descuento) * 0.19;
  double total = subtotal - descuento + impuestos;

  print("\n--- Carrito ---");
  for (var p in carrito) {
    print("- ${p.nombre} \$${p.precio}");
  }
  print("Subtotal: \$${subtotal.toStringAsFixed(2)}");
  print("Descuento: -\$${descuento.toStringAsFixed(2)}");
  print("Impuestos: +\$${impuestos.toStringAsFixed(2)}");
  print("Total final: \$${total.toStringAsFixed(2)}");
}
