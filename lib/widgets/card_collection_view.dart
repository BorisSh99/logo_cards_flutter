import 'package:flutter/material.dart';
import '../models/card_model.dart';

class CardCollectionView extends StatefulWidget {
  final String listName;
  final List<CardModel> cardList;

  const CardCollectionView({Key? key, required this.listName, required this.cardList}) : super(key: key);

  @override
  State<CardCollectionView> createState() => _CardCollectionViewState();
}

class _CardCollectionViewState extends State<CardCollectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 10 / 9,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5
          ),
          itemCount: widget.cardList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  widget.cardList[index].word
                ),
                subtitle: Text(
                  widget.cardList[index].definition,
                  textAlign: TextAlign.right,
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Update'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Delete'),
                      value: 2,
                      onTap: () {
                        setState(() {
                          widget.cardList.removeAt(index);
                        });
                      },
                    )
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PageView.builder(
                        itemCount: widget.cardList.length,
                        pageSnapping: true,
                        itemBuilder: (context, pagePosition) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Text(widget.cardList[index].word),
                          );
                        }
                      )
                    ),
                  );
                }
              ),
            );
          },
        )
      ),
    );
  }
}


