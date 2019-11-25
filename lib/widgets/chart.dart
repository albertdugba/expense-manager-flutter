import 'package:academind_flutter/model/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      return {'day': 'T', 'amount': 9.99};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        margin: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[],
        ));
  }
}
