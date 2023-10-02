import 'package:core/src/base_failure/custom_failure.dart';
import 'package:shared_dart_sependancies/shared_dart_sependancies.dart';

abstract interface class BaseUseCaseWithParams<Type,Params>{

  /// this is the base use_case class with params
  /// domain based useCases that will depend on the repository will implement this
  /// base useCase therefore ,
  /// its responsibility is to call repository functions on valid params !!!
  Future<Either<Failure,Type>>call({required Params param});

  Either<Failure, bool>validator(Params param);

}