import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';

class TodoEntity extends Equatable{
  final String name;
  final String description;
  final String id;

  TodoEntity({required this.name,required this.description,required this.id});

  @override
  List<Object?> get props => [id];

}