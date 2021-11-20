import 'package:gutenberg/app/utils/utils.dart';

class AppException {
  final Errors error;
  final String message;

  AppException(this.error, {this.message});
}
