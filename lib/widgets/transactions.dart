import 'package:expense_tracker/models/transaction_model.dart';

import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  List<TransactionModel> transactions;
  Transaction(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Image.asset(
                'assets/waiting.png',
                fit: BoxFit.cover,
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            transactions[index].date.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      )
                    ]),
                  );
                })));
  }
}
