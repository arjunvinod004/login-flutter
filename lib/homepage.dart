import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.person, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.bolt, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://as2.ftcdn.net/v2/jpg/05/89/93/27/1000_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg", // Sample profile
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Lead Detail",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "View",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),

                  Row(
                    spacing: 10,
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.email, color: Colors.black),
                      Text("arjun vt"),
                      const SizedBox(width: 10),
                      Icon(Icons.phone, color: Colors.black),
                      Text("1234567890"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                          backgroundColor:
                              Colors.grey.shade200, // button background
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.email, color: Colors.black),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.grey.shade200,
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.phone, color: Colors.black),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.grey.shade200,
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.message, color: Colors.black),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Colors.grey.shade200,
                          elevation: 2,
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.more, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(width: 0.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Lead Owner",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("Emila Hoker"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(width: 0.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Location", style: TextStyle(color: Colors.grey)),
                        Text("Emila Hoker"),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(width: 0.1),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Refferal Partner",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("Jeremy Jhones"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(width: 0.1),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Annual Income",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("10000"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              spacing: 10,
              children: [
                Icon(Icons.downloading, color: Colors.black),

                const Text(
                  "Progress",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),

                const Text("76% completed"),
              ],
            ),
            LinearProgressIndicator(
              value: 0.76,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
