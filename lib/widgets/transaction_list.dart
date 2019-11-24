import 'package:flutter/material.dart';

import 'package:academind_flutter/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transactions.map((tx) {
      return Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0)),
              padding: EdgeInsets.all(10.0),
              child: Text(
                '\$${tx.amount.toString()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(tx.title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 3.0),
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
