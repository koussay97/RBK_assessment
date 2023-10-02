import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_domain/src/todo_domain/1-repository/todo_base_repository.dart';
import 'package:shared_domain/src/todo_domain/2-entities/todo_entity.dart';

class UpdateTodoUC implements BaseUseCaseWithParams<TodoEntity, TodoEntity> {
  final ToDoBaseRepository repository;

  UpdateTodoUC({required this.repository});

  @override
  Future<Either<Failure, TodoEntity>> call({required TodoEntity param}) async {
    final validationResult = validator(param);
    return validationResult.fold(
        (l) => Left(l), (r) async => await repository.patch(entity: param));
  }

  /// im aware of the code duplication here .. we'll fix it later
  @override
  Either<Failure, bool> validator(TodoEntity param) {
    final nameValidationResult = CustomValidator.isNameValid(param.name);

    final descriptionValidationResult = param.description.length > 200;
    final idValidationResult = param.id.length > 30;

    if (!nameValidationResult.status) {
      return Left(ValidationFailure(
          stackTrace: 'AddToDoUC',
          message: nameValidationResult.errorMessage ?? '',
          code: 0));
    }
    if (!descriptionValidationResult) {
      return Left(ValidationFailure(
          stackTrace: 'AddToDoUC',
          message: 'description is too long',
          code: 1));
    }
    if (!idValidationResult) {
      return Left(ValidationFailure(
          stackTrace: 'AddToDoUC', message: 'id is too long', code: 1));
    }
    return Right(true);
  }
}
