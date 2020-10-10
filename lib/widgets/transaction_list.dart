import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                    vertical: 8, 
                    horizontal: 5),
                   child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text('\$${tx.amount}'),
                      ),
                    ),
                  ),
                  title: Text(tx.title),
                  subtitle: Text(DateFormat.yMd().format(tx.date)),
                  trailing: MediaQuery.of(context).size.width > 460  
                  ? FlatButton.icon(
                    onPressed: () => deleteTx(tx.id), 
                    icon: Icon(Icons.delete),
                    textColor: Theme.of(context).errorColor,
                    label: Text('Delete')) :
                  IconButton(
                    icon: Icon(Icons.delete), 
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(tx.id),),
                ),
              );
            },
            itemCount: transactions.length,
            
      ),
    );
  }
}