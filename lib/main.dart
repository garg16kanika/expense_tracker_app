import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transactions.dart';
import 'package:flutter/material.dart';

import 'models/transaction_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  // this list maintains the list of all the transactions
  List<TransactionModel> _userTransactions = [];

  //this mehtod adds new transactions into the userTransactions list
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

  //this method pops up the modal bottom sheet
  void startAddNewtx(BuildContext ctx) {
    //here the modal  bottom sheet returns the NewTransaction widget which takes addTransactions method as the argument
    showModalBottomSheet(
        context: ctx, builder: (_) => NewTransaction(addTransactions));
  }

  //this method fetches the list of transactions of only 7 last days into recentTransactions list
  List<TransactionModel> get recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXPENSE TRACKER'),
        actions: [
          IconButton(
            //here on pressed we want to add new transaction to the list, and hence we call the popup for modal bottom sheet
            onPressed: () => startAddNewtx(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(recentTransactions),
          Transaction(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewtx(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
