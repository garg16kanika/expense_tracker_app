import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transactions.dart';
import 'package:flutter/material.dart';

import 'models/transaction_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TransactionModel> _userTransactions = [
    TransactionModel(
        title: 'New Shoes',
        id: DateTime.now.toString(),
        amount: 13.99,
        date: DateTime.now()),
    TransactionModel(
        title: 'New cake',
        id: DateTime.now.toString(),
        amount: 15.90,
        date: DateTime.now()),
  ];

  void addTransactions(String title, double amount) {
    TransactionModel newtx = TransactionModel(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  void startAddNewtx(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTransaction(addTransactions));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPENSE TRACKER'),
        actions: [
          IconButton(
            onPressed: () => startAddNewtx(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: Text('Chart comes here'),
          ),
          Transaction(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewtx(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
