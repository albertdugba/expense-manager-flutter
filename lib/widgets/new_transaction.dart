import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;
  NewTransaction(this.addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) return;
    widget.addNewTx(enteredTitle, enteredAmount);

    Navigator.pop(context);
  }

  void _percentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      _selectedDate = pickedDate;
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            Container(
              height: 70.0,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _percentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Add a Transaction'),
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
