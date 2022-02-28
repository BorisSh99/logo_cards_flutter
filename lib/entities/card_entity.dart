class CardEntity {

  String word;
  String definition;
  int confidence;

  CardEntity(this.word, this.definition, [this.confidence = 0]);

}