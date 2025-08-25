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
    );
  }
}
