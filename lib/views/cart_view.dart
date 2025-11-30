import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'list_view.dart'; // Importamos el modelo Perfume

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  // --- LISTA GLOBAL (Estática) ---
  // Al ser static, se mantiene en memoria aunque cambiemos de pantalla
  static List<Perfume> carrito = [];

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  
  // Calcular precio total
  double get _totalPrice {
    double total = 0;
    for (var item in CartView.carrito) {
      // Convertimos "118€" -> 118.0
      String precioLimpio = item.precio.replaceAll('€', '').replaceAll(',', '.').trim();
      total += double.tryParse(precioLimpio) ?? 0;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    const Color dorado = Color(0xFFB8860B);
    const Color crema = Color(0xFFFFF8E7);

    return Scaffold(
      backgroundColor: crema,
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Mi Cesta', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '${CartView.carrito.length} artículos', 
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal)
            ),
          ],
        ),
        backgroundColor: dorado,
        foregroundColor: Colors.white,
      ),
      body: CartView.carrito.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text("Tu cesta está vacía", style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                // LISTA DE PRODUCTOS
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: CartView.carrito.length,
                    itemBuilder: (context, index) {
                      final perfume = CartView.carrito[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Container(
                            width: 50, height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: perfume.imagePath,
                              fit: BoxFit.contain,
                              errorWidget: (c,u,e) => const Icon(Icons.error),
                            ),
                          ),
                          title: Text(perfume.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(perfume.precio, style: const TextStyle(color: dorado)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                CartView.carrito.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Producto eliminado"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                // RESUMEN DE PAGO
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total a pagar:", style: TextStyle(fontSize: 18)),
                          Text(
                            "${_totalPrice.toStringAsFixed(2)}€",
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: dorado),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: dorado,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () {
                             ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("¡Compra realizada con éxito!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              setState(() {
                                CartView.carrito.clear();
                              });
                          },
                          child: const Text("TRAMITAR PEDIDO", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}