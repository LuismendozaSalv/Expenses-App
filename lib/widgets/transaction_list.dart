import './transaction_item.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty ? 
        LayoutBuilder(builder: (ctx, constrataints) {
          return Column(children: [
            Text(
              'No transactions added yet',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: constrataints.maxHeight * 0.60,
              child: Image.asset('assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],);
        })
        : 
        ListView.builder(
            itemBuilder: (ctx, index) {
              var tx = transactions[index];
              return TransactionItem(key: ValueKey(tx.id),tx: tx, deleteTx: deleteTx);
            },
            itemCount: transactions.length,
            
      ),
    );
  }
}

