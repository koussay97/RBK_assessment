import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';

abstract class Failure extends Equatable {
  final String message;
  final String stackTrace;
  final int code;

  Failure(
      {required this.message, required this.stackTrace, required this.code});

  @override
  List<Object?> get props => [code];
}

class ValidationFailure extends Failure {
  ValidationFailure(
      {required super.message, required super.stackTrace, required super.code});
}
