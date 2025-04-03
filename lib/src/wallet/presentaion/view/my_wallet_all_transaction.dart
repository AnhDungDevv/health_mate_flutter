import 'package:flutter/material.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: const [
          TransactionItem(
            title: 'Video Call',
            date: '16 Aug 2023 | 13:43 PM',
            amount: '\$50.00',
            isPositive: false,
          ),
          TransactionItem(
            title: 'Audio Call',
            date: '16 Aug 2023 | 13:43 PM',
            amount: '\$50.00',
            isPositive: false,
          ),
          TransactionItem(
            title: 'Video Call',
            date: '16 Aug 2023 | 13:43 PM',
            amount: '\$25.00',
            isPositive: false,
          ),
          TransactionItem(
            title: 'Text Message',
            date: '16 Aug 2023 | 13:43 PM',
            amount: '\$20.00',
            isPositive: false,
          ),
          TransactionItem(
            title: 'Refund',
            date: '16 Aug 2023 | 13:43 PM',
            amount: '\$5.00',
            isPositive: true,
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isPositive;

  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            isPositive ? Icons.arrow_downward : Icons.arrow_upward,
            color: isPositive ? Colors.green : Colors.red,
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
