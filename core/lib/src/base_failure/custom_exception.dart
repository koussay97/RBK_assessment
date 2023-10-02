import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';

abstract class CustomException extends Equatable implements Exception {
  final String message;
  final String? stackTrace;
  final int code;

  CustomException({required this.message,this.stackTrace,required this.code});

  @override
  List<Object?> get props => [code];
}
