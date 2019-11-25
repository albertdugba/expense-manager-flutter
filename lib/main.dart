import 'package:flutter/material.dart';

import 'package:academind_flutter/model/transaction.dart';
import 'package:academind_flutter/widgets/new_transaction.dart';
import 'package:academind_flutter/widgets/transaction_list.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Shoes', amount: 45.90, date: DateTime.now()),
    Transaction(id: 't2', title: 'Bag', amount: 55.70, date: DateTime.now()),
    Transaction(id: 't3', title: 'Pencil', amount: 0.90, date: DateTime.now()),
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

  void _startAddingNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddingNewTransactions(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 400.0,
              child: Card(
                color: Colors.purple[800],
                child: Text('Chart'),
                elevation: 5.0,
              ),
            ),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddingNewTransactions(context),
          child: Icon(Icons.add)),
    );
  }
}
