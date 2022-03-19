class CardModel {

  String term;
  String definition;
  bool isRemembered;
  bool isFavorite;

  CardModel(this.term, this.definition, [this.isRemembered = false, this.isFavorite = false]);

}