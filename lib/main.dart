import 'package:flutter/material.dart';

import 'package:academind_flutter/widgets/chart.dart';
import 'package:academind_flutter/model/transaction.dart';
import 'package:academind_flutter/widgets/new_transaction.dart';
import 'package:academind_flutter/widgets/transaction_list.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner App',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              button: TextStyle(color: Colors.white),
            ),
        primarySwatch: Colors.purple,
        accentColor: Colors.amber[900],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
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
    // Transaction(id: 't1', title: 'Shoes', amount: 45.90, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Bag', amount: 55.70, date: DateTime.now()),
    // Transaction(id: 't3', title: 'Pencil', amount: 0.90, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime dateTime) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: dateTime,
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
        title: Text('Expense Planner App'),
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
                elevation: 5.0,
              ),
            ),
            Chart(_recentTransactions),
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
