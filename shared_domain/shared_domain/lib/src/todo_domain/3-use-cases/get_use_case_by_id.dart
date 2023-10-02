import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_domain/src/todo_domain/1-repository/todo_base_repository.dart';
import 'package:shared_domain/src/todo_domain/2-entities/todo_entity.dart';

class GetToDoByIdUC implements BaseUseCaseWithParams<TodoEntity, String> {

  final ToDoBaseRepository repository;
  GetToDoByIdUC({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call({required String param}) async{
    final validationResult= validator(param);
    return validationResult.fold((l) => Left(l),
            (r) async {
     return await repository.getById(id: param);
    });
  }

  @override
  Either<Failure, bool> validator(String param) {
    /// just for testing purposes we will attach a testing abstract module
    if (param.length > 30) {
      return Left(ValidationFailure(
          code: 1, message: 'id not valid', stackTrace: 'GetToDoByIdUC'));
    }
    return Right(true);
  }
}
