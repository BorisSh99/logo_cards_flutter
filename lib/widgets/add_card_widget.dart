import 'package:flutter/material.dart';

import '../models/card_model.dart';

class AddCardWidget extends StatefulWidget {
  final List<CardModel> cardList;
  final Function addCardHandler;

  const AddCardWidget(
      {Key? key, required this.cardList, required this.addCardHandler})
      : super(key: key);

  @override
  State<AddCardWidget> createState() => _AddCardWidgetState();
}

class _AddCardWidgetState extends State<AddCardWidget> {
  final _formKey = GlobalKey<FormState>(); //for validation
  final _term = TextEditingController();
  final _definition = TextEditingController();

  final _newCard = CardModel();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add new card:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _term,
              decoration: InputDecoration(labelText: 'Term'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Term is required';
                }
                return null;
              },
              onSaved: (newValue) => _newCard.term = newValue!,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _definition,
              decoration: InputDecoration(labelText: 'Definition'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Definition is required';
                }
                return null;
              },
              onSaved: (newValue) => _newCard.definition = newValue!,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  widget.addCardHandler(_newCard);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
