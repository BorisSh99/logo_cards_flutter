import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/card_pack_model.dart';
import '../providers/card_packs_provider.dart';

class RenameCardPackWidget extends StatelessWidget {
  final CardPackModel cardPack;
  final int index;

  const RenameCardPackWidget(
      {Key? key, required this.cardPack, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //for validation

    // Provider.of... instead of Consumer due to 'listen'-argument setter (So we can manage listener (not possible with Consumer?))
    final _changeNameHandler = Provider.of<CardPacksProvider>(context, listen: false).renameAtWith;
    print('I\'m build() in RenameCardPackWidget');

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
                return value == null || value.isEmpty ? 'Name is required' : null;
              },
              initialValue: cardPack.name,
              onSaved: (newName) {
                _changeNameHandler(index, newName!);
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
