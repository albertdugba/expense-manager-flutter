import 'package:academind_flutter/widgets/new_transaction.dart';
import 'package:academind_flutter/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

import 'package:academind_flutter/widgets/transaction_list.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Expense Tracker',
    );
  }
}

class HomePage extends StatelessWidget {
  // String titleInput, amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
      ),
      body: Column(
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
          UserTransactions()
        ],
      ),
    );
  }
}
