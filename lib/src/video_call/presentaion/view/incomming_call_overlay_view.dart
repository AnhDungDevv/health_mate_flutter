import 'package:flutter/material.dart';

class IncommingCallOverlayView extends StatelessWidget {
  const IncommingCallOverlayView({super.key, required this.onReject});
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.5), // Dim background
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                    'assets/caller_profile.jpg'), // Replace with your image asset
              ),
              const SizedBox(height: 8),
              // Caller Name
              const Text(
                "Dr John Doe",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Calling Status
              const Text(
                "Calling...",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      // Handle chat action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.mic_off),
                    onPressed: () {
                      // Handle mute action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      // Handle speaker action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Call Estimation
              const Text(
                "Video call estimation 3 mins",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              // Reject Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                ),
                onPressed: onReject,
                child: const Text(
                  "Reject",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
