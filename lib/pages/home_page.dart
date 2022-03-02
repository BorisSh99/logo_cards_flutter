import 'package:flutter/material.dart';
import 'package:logophile_flutter/widgets/rename_card_list_widget.dart';
import '../entities/card_entity.dart';
import '../widgets/card_list_widget.dart';
import '../entities/card_list_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CardListEntity> cardListCollection = [];

  @override
  void initState() {
    super.initState();


    cardListCollection.add(CardListEntity('Mock list', [CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
    ]));
    cardListCollection.add(CardListEntity('Mock list1', [CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
      CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
      CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
    ]));
  }

  void onChangedName(String newName) {
    setState(() {

    });
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
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    onSelected: (value) async {
                      switch (value) {
                        case 'rename':
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return RenameCardListWidget(
                                cardListEntity: cardListCollection[index],
                                onChangedName: (newName) => setState(() {
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
                      PopupMenuItem(  //onTap pops after executing!
                        child: Text('Rename'),
                        value: 'rename',
                      ),
                      PopupMenuItem(
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
