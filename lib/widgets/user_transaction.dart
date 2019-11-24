import 'package:flutter/material.dart';
import 'package:academind_flutter/model/transaction.dart';
import 'package:academind_flutter/widgets/new_transaction.dart';
import 'package:academind_flutter/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Shoes', amount: 45.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'Bag', amount: 55.70, date: DateTime.now()),
    // Transaction(id: 't4', title: 'Pencil', amount: 0.90, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
    );
  }
}
