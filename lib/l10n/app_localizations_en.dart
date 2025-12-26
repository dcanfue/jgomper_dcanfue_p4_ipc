// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Bloom Perfumery';

  @override
  String get btnBuy => 'Proceed to Checkout';

  @override
  String get formTitle => 'Checkout Order';

  @override
  String get labelName => 'Full Name';

  @override
  String get labelAddress => 'Shipping Address';

  @override
  String get labelDate => 'Delivery Date';

  @override
  String get labelPayment => 'Payment Method';

  @override
  String get labelGift => 'Wrap as a Gift';

  @override
  String get msgConfirm => 'Confirm Order';

  @override
  String get msgConfirmBody => 'Are you sure you want to place this order?';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get btnConfirm => 'Confirm';

  @override
  String get errorEmpty => 'Required field';

  @override
  String get payCard => 'Credit Card';

  @override
  String get payPayPal => 'PayPal';

  @override
  String get orderSuccess => 'Order Placed Successfully!';
}
