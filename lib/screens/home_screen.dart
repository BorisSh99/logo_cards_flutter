import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/add_card_pack_widget.dart';
import '../widgets/rename_card_pack_widget.dart';
import '../models/card_model.dart';
import '../widgets/card_pack_view.dart';
import '../models/card_pack_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CardPackModel> _cardPackList = [];

  @override
  void initState() {
    super.initState();


    _cardPackList.add(CardPackModel('Mock list', [CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
                                            CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
    ]));
    _cardPackList.add(CardPackModel('Mock list1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz\ngfdgdf\ngdfgdf', [CardModel('John55555555555555555555555554\ndfsd', 'Джон\ndfsgsdf'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
      CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
      CardModel('John', 'Джон'), CardModel('Mary', 'Мэри'), CardModel('Arthur', 'Артур'),
    ]));
  }

  void _addCardPack(String name) {
    setState(() {
      _cardPackList.add(CardPackModel(name, [] ));
    });
  }

  final duration = Duration(milliseconds: 300);
  bool _isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Card-Collections'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _isFabVisible ? Offset.zero : Offset(0, 2),
        child: FloatingActionButton.extended(
          label: Text('ADD NEW PACK'),
          icon: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AddCardPackWidget(
                  cardPackList: _cardPackList,
                  addCardPackHandler: _addCardPack,
                );
              },
            );
          },
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if (direction == ScrollDirection.forward) {
            if (!_isFabVisible) setState(() => _isFabVisible = true); //performance
          } else if (direction == ScrollDirection.reverse) {
            if (_isFabVisible) setState(() => _isFabVisible = false);
          }
          return true;
        },
        child: ListView.builder(
          itemCount: _cardPackList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: Material(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                elevation: 6.0,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CardPackView(listName: _cardPackList[index].name, cardList: _cardPackList[index].cardList)
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _cardPackList[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                          child: Text(
                            'MOCK',
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
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Text('BUTTON'),
                              ),
                              PopupMenuButton(
                                onSelected: (value) async {
                                  switch (value) {
                                    case 'rename':
                                      return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return RenameCardPackWidget(
                                            cardPack: _cardPackList[index],
                                            changeNameHandler: (newName) => setState(() { //setState of current cardListName
                                              _cardPackList[index].name = newName;
                                            })
                                          );
                                        },
                                      );
                                    case 'delete':
                                      setState(() {
                                        _cardPackList.removeAt(index);
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
