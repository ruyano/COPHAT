part of 'family_bloc.dart';

abstract class FamilyState extends Equatable {
  const FamilyState();

  @override
  List<Object?> get props => [];
}


class FamilyEmpty extends FamilyState {

  const FamilyEmpty();

  @override
  List<Object?> get props => [];
}

class FamilyLoading extends FamilyState {

  const FamilyLoading();

  @override
  List<Object?> get props => [];
}

class FamilySuccess extends FamilyState {

  final List<FamilyEntity>? questionsList;

  const FamilySuccess({
    this.questionsList
  });

  @override
  List<Object?> get props => [
    questionsList
  ];
}

class CreateOrUpdateOrDeleteSuccess extends FamilyState {

  const CreateOrUpdateOrDeleteSuccess();

  @override
  List<Object?> get props => [];
}

class FamilyError extends FamilyState {

  final String message;

  const FamilyError( this.message, );

  @override
  List<Object?> get props => [
    message,
  ];
}

