import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/card_model.dart';
import '../models/card_pack_model.dart';

class CardPacksProvider extends ChangeNotifier {

  List<CardPackModel> _cardPackList = [CardPackModel('Mock list', [CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                              CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                              CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),]),
    CardPackModel('Mock list1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz\ngfdgdf\ngdfgdf', [CardModel('John55555555555555555555555554\ndfsd', 'Джон\ndfsgsdf'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
          CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
          CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),]),
  ];

  UnmodifiableListView<CardPackModel> get cardPackList {
    return UnmodifiableListView(_cardPackList);
  }

  void addCardPack(String cardPackName) {
    _cardPackList.add(CardPackModel(cardPackName, []));
    notifyListeners();
  }

  void deleteAt(int index) {
    _cardPackList.removeAt(index);
    notifyListeners();
  }

  void renameAtWith (int index, String newName) {
    _cardPackList[index].name = newName;
    notifyListeners();
  }


}