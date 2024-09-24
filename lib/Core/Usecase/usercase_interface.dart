import "package:blogging/Core/error/failure.dart";
import "package:fpdart/fpdart.dart";

abstract interface class UseCase<SuccessType, Params> {

  //usecase can have only one function  it just because usecase need to do one task

  Future<Either<Failure, SuccessType>> call(Params params);
}