// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Perfumería Bloom';

  @override
  String get btnBuy => 'Tramitar Pedido';

  @override
  String get formTitle => 'Finalizar Compra';

  @override
  String get labelName => 'Nombre Completo';

  @override
  String get labelAddress => 'Dirección de Envío';

  @override
  String get labelDate => 'Fecha de Entrega';

  @override
  String get labelPayment => 'Método de Pago';

  @override
  String get labelGift => 'Envolver para regalo';

  @override
  String get msgConfirm => 'Confirmar Pedido';

  @override
  String get msgConfirmBody => '¿Estás seguro de realizar el pedido?';

  @override
  String get btnCancel => 'Cancelar';

  @override
  String get btnConfirm => 'Confirmar';

  @override
  String get errorEmpty => 'Campo obligatorio';

  @override
  String get payCard => 'Tarjeta de Crédito';

  @override
  String get payPayPal => 'PayPal';

  @override
  String get orderSuccess => '¡Pedido realizado con éxito!';
}
