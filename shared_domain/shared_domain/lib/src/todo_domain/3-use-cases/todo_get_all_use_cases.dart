import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_domain/src/todo_domain/1-repository/todo_base_repository.dart';
import 'package:shared_domain/src/todo_domain/2-entities/todo_entity.dart';

class GetAllToDosUC implements BaseUseCaseWithoutParams<List<TodoEntity>>{

final ToDoBaseRepository repository;


GetAllToDosUC({required this.repository});

  @override
  Future<Either<Failure, List<TodoEntity>>> call() async{
  return await repository.fetch();
  }


}