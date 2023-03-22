import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  // this method adds a new Transaction to the list of userTransaction in the main method.
  void onSubmitted() {
    String enteredTitle = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if (enteredTitle == "" || enteredAmount < 0) {
      return;
    }

    addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          onSubmitted: (_) => onSubmitted(),
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        TextField(
          onSubmitted: (_) => onSubmitted(),
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('Amount'),
          ),
        ),
        TextButton(
          onPressed: onSubmitted,
          child: const Text(
            'Add Transaction',
            style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
