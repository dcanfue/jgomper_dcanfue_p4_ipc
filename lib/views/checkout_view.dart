import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Para las traducciones
import 'package:intl/intl.dart'; // Para formatear la fecha
import '../models/order_model.dart';
import '../main.dart'; // Para poder cambiar el idioma

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  // Clave global para validar el formulario
  final _formKey = GlobalKey<FormState>();
  
  // Instancia de nuestro modelo de datos
  final OrderModel _order = OrderModel();
  
  // Controlador para el campo de texto de la fecha
  final TextEditingController _dateCtrl = TextEditingController();

  // Función que se ejecuta al pulsar "Confirmar"
  void _submitOrder() {
    final l10n = AppLocalizations.of(context)!;
    
    // 1. VALIDACIÓN DEL FORMULARIO (Requisito 30%)
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Guarda los datos en _order
      
      // 2. DIÁLOGO MODAL (Requisito 20%)
      showDialog(
        context: context,
        barrierDismissible: false, // Obliga a pulsar un botón para cerrar
        builder: (ctx) => AlertDialog(
          title: Text(l10n.msgConfirm),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.msgConfirmBody),
              const SizedBox(height: 10),
              // Mostramos resumen de los datos
              Text("👤 ${l10n.labelName}: ${_order.name}"),
              Text("💳 ${l10n.labelPayment}: ${_order.paymentMethod}"),
              if (_order.deliveryDate != null)
                 Text("📅 ${l10n.labelDate}: ${DateFormat('dd/MM/yyyy').format(_order.deliveryDate!)}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx), // Cerrar diálogo
              child: Text(l10n.btnCancel, style: const TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx); // Cierra diálogo
                Navigator.pop(context); // Vuelve al carrito
                
                // Feedback visual (SnackBar)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.orderSuccess),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              child: Text(l10n.btnConfirm),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Acceso rápido a las traducciones
    final l10n = AppLocalizations.of(context)!;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.formTitle),
        actions: [
          // 3. SELECTOR DE IDIOMA (Requisito Internacionalización)
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            tooltip: 'Cambiar idioma',
            onSelected: (Locale locale) => MyApp.of(context)?.setLocale(locale),
            itemBuilder: (context) => [
              const PopupMenuItem(value: Locale('es'), child: Text('🇪🇸 Español')),
              const PopupMenuItem(value: Locale('en'), child: Text('🇬🇧 English')),
              const PopupMenuItem(value: Locale('ca'), child: Text('🦇 Valencià')),
            ],
          ),
        ],
      ),
      
      // 4. RESPONSIVENESS (Requisito 20%)
      // Usamos LayoutBuilder para saber el ancho de la pantalla
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Si es mayor de 600px (Tablets/Web/Horizontal) usamos diseño ancho
          bool isWide = constraints.maxWidth > 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Icono decorativo
                  Icon(Icons.shopping_bag_outlined, size: 60, color: primaryColor),
                  const SizedBox(height: 20),

                  // LÓGICA RESPONSIVE:
                  // Si es ancho -> Fila (Row) con dos columnas
                  // Si es estrecho -> Columna (Column) uno debajo de otro
                  if (isWide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildNameField(l10n)),
                        const SizedBox(width: 20),
                        Expanded(child: _buildAddressField(l10n)),
                      ],
                    )
                  else ...[
                    _buildNameField(l10n),
                    const SizedBox(height: 15),
                    _buildAddressField(l10n),
                  ],

                  const SizedBox(height: 15),

                  // Selector de Fecha (DatePicker)
                  TextFormField(
                    controller: _dateCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.labelDate,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.calendar_today),
                    ),
                    readOnly: true, // No se puede escribir, solo tocar
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().add(const Duration(days: 1)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        locale: Localizations.localeOf(context), // Calendario en el idioma correcto
                      );
                      if (picked != null) {
                        _order.deliveryDate = picked;
                        _dateCtrl.text = DateFormat('dd/MM/yyyy').format(picked);
                      }
                    },
                    validator: (v) => v!.isEmpty ? l10n.errorEmpty : null,
                  ),

                  const SizedBox(height: 15),
                  
                  // Desplegable (Dropdown)
                  DropdownButtonFormField<String>(
                    value: 'Card',
                    decoration: InputDecoration(
                      labelText: l10n.labelPayment,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.payment),
                    ),
                    items: [
                      DropdownMenuItem(value: 'Card', child: Text(l10n.payCard)),
                      DropdownMenuItem(value: 'PayPal', child: Text(l10n.payPayPal)),
                    ],
                    onChanged: (v) => _order.paymentMethod = v!,
                  ),

                  const SizedBox(height: 10),

                  // Casilla de verificación (Checkbox)
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.labelGift),
                    secondary: const Icon(Icons.card_giftcard),
                    value: _order.isGift,
                    activeColor: primaryColor,
                    onChanged: (v) => setState(() => _order.isGift = v!),
                  ),

                  const SizedBox(height: 30),
                  
                  // Botón de Enviar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submitOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 5,
                      ),
                      child: Text(
                        l10n.msgConfirm.toUpperCase(),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper para el campo Nombre
  Widget _buildNameField(AppLocalizations l10n) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: l10n.labelName, 
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.person),
      ),
      validator: (v) => v!.isEmpty ? l10n.errorEmpty : null,
      onSaved: (v) => _order.name = v!,
    );
  }

  // Helper para el campo Dirección
  Widget _buildAddressField(AppLocalizations l10n) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: l10n.labelAddress, 
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.home),
      ),
      validator: (v) => v!.isEmpty ? l10n.errorEmpty : null,
      onSaved: (v) => _order.address = v!,
    );
  }
}