enum AnswerType {
  singleOption,
  multipleOption,
  scaled,
}

extension AnswerTypeExtension on AnswerType {

  String get label {
    switch (this) {
      case AnswerType.singleOption:
        return 'Resposta única';
      case AnswerType.multipleOption:
        return 'Multiplas respostas';
      case AnswerType.scaled:
        return 'Escala de 0 a 4';
    }
  }

}