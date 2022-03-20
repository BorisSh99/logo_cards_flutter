import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logophile_flutter/providers/animation_fab_provider.dart';
import '../providers/card_packs_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/add_card_pack_widget.dart';
import '../widgets/rename_card_pack_widget.dart';
import '../widgets/card_pack_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final _cardPacksData = Provider.of<CardPacksProvider>(context);
    final _cardPackList = _cardPacksData.cardPackList;
    print('I\'m build() in HomeScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Card-Collections'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<AnimationFabProvider>(
        builder: (_context, provider, _child) {
          print('I\'m Consumer<AnimationFabProvider> in HomeScreen (FAB)');
          return AnimatedSlide(
            duration: AnimationFabProvider.duration,
            offset: provider.isFabVisible ? Offset.zero : Offset(0, 2),
            child: FloatingActionButton.extended(
              label: Text('ADD NEW PACK'),
              icon: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddCardPackWidget();
                  },
                );
              },
            ),
          );
        },
      ),
      body: Consumer<AnimationFabProvider>(
        builder: (_context, ref, child) {
          print('I\'m Consumer<AnimationFabProvider> in HomeScreen (NotificationListener)');
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.forward) {
                if (!ref.isFabVisible) ref.swapIsFabVisible(); //performance
              } else if (direction == ScrollDirection.reverse) {
                if (ref.isFabVisible) ref.swapIsFabVisible();
              }
              return true;
            },
            child: child!,
          );
        },
        child: ListView.builder(
          itemCount: _cardPackList.length,
          itemBuilder: (context, index) {
            print('I\'m $index');
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
                                            index: index, //performant?
                                          );
                                        },
                                      );
                                    case 'delete':
                                      _cardPacksData.deleteAt(index);
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
