import 'package:flutter/material.dart';
import 'package:logophile_flutter/widgets/rename_card_list_widget.dart';
import '../models/card_model.dart';
import '../widgets/card_list_widget.dart';
import '../models/card_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CardListModel> cardListCollection = [];

  @override
  void initState() {
    super.initState();


    cardListCollection.add(CardListModel('Mock list', [CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
    ]));
    cardListCollection.add(CardListModel('Mock list1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz\ngfdgdf\ngdfgdf', [CardModel('John55555555555555555555555554', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
      CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
      CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Card-Lists'),
      ),
      body: ListView.builder(
        itemCount: cardListCollection.length,
        itemBuilder: (context, index) {
          return Card(
            child: Stack(
              children: [
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 13.0),
                    child: Text(cardListCollection[index].name),
                  ),
                  subtitle: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            cardListCollection[index].name = 'test';
                          });
                        },
                        icon: Icon(Icons.delete),
                        splashRadius: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        splashRadius: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        splashRadius: 20,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CardListWidget(listName: cardListCollection[index].name, cardList: cardListCollection[index].cardList)
                      ),
                    );
                  },
                  trailing: PopupMenuButton(
                    onSelected: (value) async {
                      switch (value) {
                        case 'rename':
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return RenameCardListWidget(
                                cardListEntity: cardListCollection[index],
                                changeNameHandler: (newName) => setState(() { //setState of current cardListName
                                  cardListCollection[index].name = newName;
                                })
                              );
                            },
                          );
                        case 'delete':
                          setState(() {
                            cardListCollection.removeAt(index);
                          });
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(  //onTap pops after executing!
                        child: Text('Rename'),
                        value: 'rename',
                      ),
                      const PopupMenuItem(
                        child: Text('Delete'),
                        value: 'delete',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
