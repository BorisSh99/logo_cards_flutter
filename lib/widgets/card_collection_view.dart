import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        padding: const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: widget.cardList.length,
          itemBuilder: (context, index) {
            return /*Card(
              child: ListTile(
                title: Text(
                  widget.cardList[index].term
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
                            child: Text(widget.cardList[index].term),
                          );
                        }
                      )
                    ),
                  );
                }
              ),
            );*/
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    /*boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x4D090F13),
                        offset: Offset(0, 2),
                      )
                    ],*/
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                                /*style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF4B39EF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),*/
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  widget.cardList[index].definition,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                  /*style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),*/
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () {},
                                    ),
                                    /*FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Buy Now',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 50,
                                        color: Color(0xFF4B39EF),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        elevation: 2,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 50,
                                      ),
                                    ),*/
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                        /*FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.add_box_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              );
          },
        )
      ),
    );
  }
}


