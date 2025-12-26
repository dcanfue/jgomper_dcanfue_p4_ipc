// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Perfumeria Bloom';

  @override
  String get btnBuy => 'Tramitar Comanda';

  @override
  String get formTitle => 'Finalitzar Compra';

  @override
  String get labelName => 'Nom Complet';

  @override
  String get labelAddress => 'Adreça d\'Enviament';

  @override
  String get labelDate => 'Data d\'Entrega';

  @override
  String get labelPayment => 'Mètode de Pagament';

  @override
  String get labelGift => 'Embolicar per a regal';

  @override
  String get msgConfirm => 'Confirmar Comanda';

  @override
  String get msgConfirmBody => 'Estàs segur de realitzar la comanda?';

  @override
  String get btnCancel => 'Cancel·lar';

  @override
  String get btnConfirm => 'Confirmar';

  @override
  String get errorEmpty => 'Camp obligatori';

  @override
  String get payCard => 'Targeta de Crèdit';

  @override
  String get payPayPal => 'PayPal';

  @override
  String get orderSuccess => 'Comanda realitzada amb èxit!';
}
