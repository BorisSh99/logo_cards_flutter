import '../entities/card_entity.dart';

class CardListEntity {

  String name;
  List<CardEntity> cardList;

  CardListEntity(this.name, this.cardList);

  void addCard(CardEntity cardEntity) {
    cardList.add(cardEntity);
  }



}