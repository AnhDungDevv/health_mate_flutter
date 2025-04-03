import 'package:flutter/material.dart';

class ConsultationTypeWidget extends StatelessWidget {
  const ConsultationTypeWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Consultation Type Header
          const Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                "Consultation Type",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Audio Call Option
          const Row(
            children: [
              Icon(Icons.radio_button_checked, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                "Audio Call",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),

          // Estimated Consult Time
          const Text(
            "Estimated Consult Time",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeButton(context, "5 min"),
              _buildTimeButton(context, "15 min"),
              _buildTimeButton(context, "30 min"),
            ],
          ),
          const SizedBox(height: 16.0),

          // Bill Details
          const Text(
            "Bill Details",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8.0),
          _buildBillDetailRow("Audio Call Cost (15 mins)", "\$30.00"),
          _buildBillDetailRow("Service Fee & Taxes", "\$1.00"),
          const Divider(),
          _buildBillDetailRow(
            "Total Balance",
            "\$31.00",
            isBold: true,
          ),
          const SizedBox(height: 8.0),
          const Text(
            "*Call will auto disconnect when amount is lower than per min consult charge.",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16.0),

          // Connect Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle connect action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                "Connect with Consult",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context, String time) {
    return OutlinedButton(
      onPressed: () {
        // Handle time selection
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        time,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBillDetailRow(String label, String value,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
