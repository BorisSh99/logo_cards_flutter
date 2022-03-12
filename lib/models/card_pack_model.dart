import '../models/card_model.dart';

class CardPackModel {

  String name;
  List<CardModel> cardList;

  CardPackModel(this.name, this.cardList);

  void addCard(CardModel cardEntity) {
    cardList.add(cardEntity);
  }



}