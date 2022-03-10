import '../models/card_model.dart';

class CardCollectionModel {

  String name;
  List<CardModel> cardList;

  CardCollectionModel(this.name, this.cardList);

  void addCard(CardModel cardEntity) {
    cardList.add(cardEntity);
  }



}