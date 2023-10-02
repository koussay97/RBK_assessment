import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_domain/src/todo_domain/1-repository/todo_base_repository.dart';

class DeleteToDoUC implements BaseUseCaseWithParams<bool, String> {
  final ToDoBaseRepository repository;

  DeleteToDoUC({required this.repository});

  @override
  Future<Either<Failure, bool>> call({required String param}) async{
  return await repository.delete(id: param);
  }

  /// we will not validate the id this time
  /// to show you that the usage of the method is completely optional depending on your logic
  @override
  Either<Failure, bool> validator(String param) {
    // TODO: implement validator
    throw UnimplementedError();
  }
}
