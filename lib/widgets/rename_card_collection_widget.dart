import 'package:flutter/material.dart';
import '../models/card_collection_model.dart';

class RenameCardListWidget extends StatelessWidget {
  final CardCollectionModel cardCollection;
  final Function changeNameHandler;

  const RenameCardListWidget(
      {Key? key, required this.cardCollection, required this.changeNameHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //for validation

    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rename card collection:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'New name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              initialValue: cardCollection.name,
              onSaved: (value) {
                changeNameHandler(value);
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
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
