import '../models/card_model.dart';

class CardListModel {

  String name;
  List<CardModel> cardList;

  CardListModel(this.name, this.cardList);

  void addCard(CardModel cardEntity) {
    cardList.add(cardEntity);
  }



}