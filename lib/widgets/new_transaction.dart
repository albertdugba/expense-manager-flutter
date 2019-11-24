import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              child: Text('Add a Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                addNewTx(
                    titleController.text, double.parse(amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
