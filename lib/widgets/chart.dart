import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<TransactionModel> recentTransactions;

  Chart(this.recentTransactions);

  //this getter is responsible for getting recentTransactions list and converting it into a list with weekday name and amount per day.
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      //loops through the entire recentTransactions list and find the totalSpending of that particular day
      for (var i = 0; i < recentTransactions.length; i++) {
        if (weekDay.day == recentTransactions[i].date.day &&
            weekDay.month == recentTransactions[i].date.month &&
            weekDay.year == recentTransactions[i].date.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      // we finally return a map with day and amount for that particular day and this happens for past 7 days
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  // this method helps to find the total spending of that entire week, done using finding the total spending of the entier recentTransactions List as it contains data of the past 7 days of transactions only
  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tx) {
            return ChartBar(
                label: tx['day'].toString(),
                amount: (tx['amount'] as double),
                spendingPCT: totalSpending == 0.0
                    ? 0.0
                    : (tx['amount'] as double) / totalSpending);
          }).toList()),
    );
  }
}
