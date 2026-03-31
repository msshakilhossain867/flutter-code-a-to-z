import 'package:flutter/material.dart';

class WrapDiscovery extends StatelessWidget {
  const WrapDiscovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wrap Mastery")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("নিচের বাটনগুলো জায়গা না থাকলে অটোমেটিক নিচে নামবে:", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // --- আসল খেলা এখানে ---
            Wrap(
              direction: Axis.horizontal, // ডিফল্টভাবে ডানে-বামে সাজায়
              alignment: WrapAlignment.start, // শুরু থেকে সাজাবে
              spacing: 10.0, // পাশাপাশি বাটনগুলোর মাঝখানের গ্যাপ
              runSpacing: 15.0, // এক লাইন থেকে অন্য লাইনের মাঝখানের গ্যাপ
              children: [
                _buildChip("Flutter"),
                _buildChip("Dart"),
                _buildChip("Stateful"),
                _buildChip("Stateless"),
                _buildChip("BottomNav"),
                _buildChip("PageView"),
                _buildChip("Wrap Widget"),
                _buildChip("Responsive Design"),
                _buildChip("LayoutBuilder"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // বাটন বা চিপ তৈরির হেল্পার
  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blue.shade100,
      avatar: const CircleAvatar(child: Icon(Icons.check, size: 15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
} 