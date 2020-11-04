import 'dart:math';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction tx;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;

  @override
  void initState() {
    const availableColors = 
    [
      Colors.red,
      Colors.blueAccent,
      Colors.black,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
          vertical: 8, 
          horizontal: 5),
         child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text('\$${widget.tx.amount}'),
            ),
          ),
        ),
        title: Text(widget.tx.title),
        subtitle: Text(DateFormat.yMd().format(widget.tx.date)),
        trailing: MediaQuery.of(context).size.width > 460  
        ? FlatButton.icon(
          onPressed: () => widget.deleteTx(widget.tx.id), 
          icon: Icon(Icons.delete),
          textColor: Theme.of(context).errorColor,
          label: Text('Delete')) :
        IconButton(
          icon: Icon(Icons.delete), 
          color: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.tx.id),),
      ),
    );
  }
}