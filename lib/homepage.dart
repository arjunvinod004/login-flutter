import 'package:flutter/material.dart';
import 'package:login_one/staff_model/staff.dart';
import 'auth_services.dart'; // 👈 your API service

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Datum> staffResponse = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchStaff();
  }

  Future<void> fetchStaff() async {
    try {
      final response = await AuthServices().getStaff(); // 👈 API call
      setState(() {
        staffResponse = response;
        isLoading = false;
      });
      print("✅ API Response: $response"); // Debug log
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
      print("⚠️ Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Icon(Icons.person, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.bolt, color: Colors.black),
          SizedBox(width: 20),
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 20),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://as2.ftcdn.net/v2/jpg/05/89/93/27/1000_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg",
            ),
          ),
          SizedBox(width: 12),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        child: isLoading
            ? const Center(child: CircularProgressIndicator()) // ⏳ loading
            : errorMessage != null
            ? Center(child: Text("Error: $errorMessage")) // ❌ error
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const One(),
                    Two(widget: widget),
                    const SizedBox(height: 10),

                    // 👇 Print the full JSON response
                    const SizedBox(height: 20),

                    // 👇 Example: print first staff name if available
                  ],
                ),
              ),
      ),
    );
  }
}

class Two extends StatelessWidget {
  const Two({super.key, required this.widget});

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.email,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "1234567890",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 10,
                children: const [
                  Icon(Icons.email, color: Colors.black),
                  Text(
                    "Arjun vt",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.phone, color: Colors.black),
                  Text(
                    "1234567890",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.email, color: Colors.black),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fast Bites',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Fast Orders',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      'Up to 3 times per day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.black),
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Order Now',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/burger.png',
                    height: 160, // set height
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ],
    );
  }
}

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
