import 'package:core/core.dart';
import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';
import 'package:shared_domain/src/todo_domain/2-entities/todo_entity.dart';

abstract interface class ToDoBaseRepository{
  Future<Either<Failure,List<TodoEntity>>> fetch();
  Future<Either<Failure,TodoEntity>> getById({required String id});
  Future<Either<Failure,bool>> delete({required String id});
  Future<Either<Failure,TodoEntity>> store({required TodoEntity entity});
  Future<Either<Failure,TodoEntity>> patch({required TodoEntity entity});
}