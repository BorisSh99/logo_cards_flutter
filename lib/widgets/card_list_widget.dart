import 'package:flutter/material.dart';
import 'package:logophile_flutter/entities/card_entity.dart';

class CardListWidget extends StatelessWidget {
  final String listName;
  final List<CardEntity> cardList;

  const CardListWidget({Key? key, required this.listName, required this.cardList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 150,
          ),
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  cardList[index].word
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PageView.builder(
                        itemCount: cardList.length,
                        pageSnapping: true,
                        itemBuilder: (context, pagePosition) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Text(cardList[index].word),
                          );
                        }
                      )
                    ),
                  );
                }
              )
            );
          },
        )
      ),
    );
  }
}


