part of 'family_bloc.dart';

abstract class FamilyEvent extends Equatable {

  const FamilyEvent();

  @override
  List<Object?> get props => [];
}

class CreateFamilyEvent extends FamilyEvent {

  final FamilyModel questionModel;

  const CreateFamilyEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class ReadFamilyEvent extends FamilyEvent {

  const ReadFamilyEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFamilyEvent extends FamilyEvent {

  final FamilyModel questionModel;

  const UpdateFamilyEvent({
    required this.questionModel,
  });

  @override
  List<Object?> get props => [
    questionModel,
  ];
}

class DeleteFamilyEvent extends FamilyEvent {

  final String id;

  const DeleteFamilyEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id,
  ];
}


