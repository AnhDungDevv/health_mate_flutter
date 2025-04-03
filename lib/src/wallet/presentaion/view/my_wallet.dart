import 'package:flutter/material.dart';

class MyWalletView extends StatelessWidget {
  const MyWalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Wallet Balance Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Total available amount',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$125.23',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Add Amount'),
                ),
              ],
            ),
          ),
          // Recent Transactions Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
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
                TransactionItem(
                  title: 'Top-up Amount',
                  date: '16 Aug 2023 | 13:43 PM',
                  amount: '\$500.00',
                  isPositive: true,
                ),
              ],
            ),
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
      child: Row(
        children: [
          Icon(
            isPositive ? Icons.arrow_downward : Icons.arrow_upward,
            color: isPositive ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
