class SingleAnswerModel {
  String? singleAnswer;
  List<bool>? multipleAnswers;
  List<int>? scaledAnswers;

  SingleAnswerModel({this.singleAnswer, this.multipleAnswers, this.scaledAnswers});

  SingleAnswerModel.fromJson(Map<String, dynamic> json) {
    singleAnswer = json['singleAnswer'];
    multipleAnswers = json['multipleAnswers']?.cast<bool>();
    scaledAnswers = json['scaledAnswers']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['singleAnswer'] = singleAnswer;
    data['multipleAnswers'] = multipleAnswers;
    data['scaledAnswers'] = scaledAnswers;
    return data;
  }
}