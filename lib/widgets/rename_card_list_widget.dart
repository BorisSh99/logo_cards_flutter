import 'package:flutter/material.dart';
import 'package:logophile_flutter/entities/card_list_entity.dart';

class RenameCardListWidget extends StatelessWidget {
  final CardListEntity cardListEntity;
  final Function onChangedName;
  const RenameCardListWidget({Key? key, required this.cardListEntity, required this.onChangedName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();  //for validation
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rename card collection:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'New name'),
              maxLength: 32,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              initialValue: cardListEntity.name,
              onSaved: (value) {
                onChangedName(value);
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
