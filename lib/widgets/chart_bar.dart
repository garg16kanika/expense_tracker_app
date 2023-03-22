import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double spendingPCT;

  ChartBar(
      {required this.label, required this.amount, required this.spendingPCT});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(children: [
        Text(
          amount.toStringAsFixed(2),
        ),
        Container(
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPCT,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(label),
      ]),
    );
  }
}
