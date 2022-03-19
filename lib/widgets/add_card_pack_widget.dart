import 'package:flutter/material.dart';
import 'package:logophile_flutter/providers/card_packs_provider.dart';
import 'package:provider/provider.dart';


class AddCardPackWidget extends StatelessWidget {

  const AddCardPackWidget(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //for validation

    // Provider.of... instead of Consumer due to 'listen'-argument setter (So we can manage listener (not possible with Consumer?))
    final _addCardPackHandler = Provider.of<CardPacksProvider>(context, listen: false).addCardPack;
    print('I\'m build() in AddCardPackWidget');

    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add card collection:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              onSaved: (value) {
                _addCardPackHandler(value!);
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
