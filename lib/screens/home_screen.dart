import 'package:flutter/material.dart';
import '../widgets/rename_card_collection_widget.dart';
import '../models/card_model.dart';
import '../widgets/card_collection_view.dart';
import '../models/card_collection_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CardCollectionModel> cardCollectionList = [];

  @override
  void initState() {
    super.initState();


    cardCollectionList.add(CardCollectionModel('Mock list', [CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
    ]));
    cardCollectionList.add(CardCollectionModel('Mock list1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz\ngfdgdf\ngdfgdf', [CardModel('John55555555555555555555555554', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
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
        itemCount: cardCollectionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CardCollectionView(listName: cardCollectionList[index].name, cardList: cardCollectionList[index].cardList)
                  ),
                );
              },
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 13.0),
                      child: Text(cardCollectionList[index].name),
                    ),
                    subtitle: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cardCollectionList[index].name = 'test';
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
                    trailing: PopupMenuButton(
                      onSelected: (value) async {
                        switch (value) {
                          case 'rename':
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return RenameCardListWidget(
                                  cardCollection: cardCollectionList[index],
                                  changeNameHandler: (newName) => setState(() { //setState of current cardListName
                                    cardCollectionList[index].name = newName;
                                  })
                                );
                              },
                            );
                          case 'delete':
                            setState(() {
                              cardCollectionList.removeAt(index);
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
                  IconButton(
                    icon: Icon(Icons.ac_unit),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
