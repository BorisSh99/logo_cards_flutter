import 'package:flutter/material.dart';
import 'package:logophile_flutter/entities/card_entity.dart';
import 'package:logophile_flutter/widgets/card_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, List<CardEntity>> cardMap = {};

  @override
  void initState() {
    super.initState();
    

    cardMap.putIfAbsent('Mock list', () => [CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
    ]);
    cardMap.putIfAbsent('Mock list1', () => [CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
                                            CardEntity('John', 'Джон'), CardEntity('Mary', 'Мэри'), CardEntity('Arthur', 'Артур'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Card-Lists'),
      ),
      body: ListView.builder(
        itemCount: cardMap.length,
        itemBuilder: (context, index) {
          String listName = cardMap.keys.toList()[index];
          return Card (
            child: ListTile(
              title: Text(listName),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CardListWidget(listName: listName, cardList: cardMap[listName] ?? [])
                  ),
                );
              },
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Rename'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('Delete'),
                    value: 2,
                    onTap: () {
                      setState(() {
                        cardMap.remove(cardMap.keys.toList()[index]);
                      });
                    },
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
