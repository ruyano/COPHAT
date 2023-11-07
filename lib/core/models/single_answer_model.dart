class SingleAnswerModel {
  String? singleAnswer;
  List<String>? multipleAnswers;
  List<String>? scaledAnswers;

  SingleAnswerModel({this.singleAnswer, this.multipleAnswers, this.scaledAnswers});

  SingleAnswerModel.fromJson(Map<String, dynamic> json) {
    singleAnswer = json['singleAnswer'];
    multipleAnswers = json['multipleAnswers']?.cast<String>();
    scaledAnswers = json['scaledAnswers']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['singleAnswer'] = singleAnswer;
    data['multipleAnswers'] = multipleAnswers;
    data['scaledAnswers'] = scaledAnswers;
    return data;
  }
}