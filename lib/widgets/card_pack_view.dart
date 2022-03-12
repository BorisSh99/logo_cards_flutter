import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import '../models/card_model.dart';
import './add_card_widget.dart';

class CardPackView extends StatefulWidget {
  final String listName;
  final List<CardModel> cardList;

  const CardPackView({Key? key, required this.listName, required this.cardList}) : super(key: key);

  @override
  State<CardPackView> createState() => _CardPackViewState();
}

class _CardPackViewState extends State<CardPackView> {

  void _addCard(CardModel newCard) {
    setState(() {
      widget.cardList.add(newCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listName),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('ADD CARD'),
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddCardWidget(
                cardList: widget.cardList,
                addCardHandler: _addCard,
              );
            },
          );
        },
      ),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: widget.cardList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
            child: Material(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              elevation: 6.0,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 6),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cardList[index].term,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              widget.cardList[index].definition,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                                PopupMenuButton(
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


