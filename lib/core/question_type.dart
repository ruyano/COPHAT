enum QuestionType {
  compreensaoDoenca,
  internacao,
  realizacaoEExitoDoTratamento,
  efeitosColaterais,
  expectativaDoRetornoAEscola,
}

extension QuestionTypeExtension on QuestionType {

  String get label {
    switch (this) {
      case QuestionType.compreensaoDoenca:
        return 'Compreensão doença';
      case QuestionType.internacao:
        return 'Internação';
      case QuestionType.realizacaoEExitoDoTratamento:
        return 'Realização e êxito do tratamento';
      case QuestionType.efeitosColaterais:
        return 'Efeitos colaterais';
      case QuestionType.expectativaDoRetornoAEscola:
        return 'Expectativa do retorno á escola';
    }
  }

}