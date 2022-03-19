import 'package:flutter/material.dart';

import '../models/card_pack_model.dart';

class CardPacksProvider with ChangeNotifier {

  List<CardPackModel> _cardPackList = [];

  List<CardPackModel> get cardPackList {
    return [..._cardPackList];
  }

  void addCardPack() {
    // _cardPackList.add(value);
    notifyListeners();
  }


}