import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_one/homepage.dart';
import 'package:login_one/loginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  bool rememberMe = false;

  void register() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String firstname = _firstnameController.text;
    String lastname = _lastnameController.text;
    if (email.isEmpty ||
        password.isEmpty ||
        lastname.isEmpty ||
        firstname.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter all fields")));
      return;
    }
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => HomePage(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Signup Account !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Enter Your Personal Data to Create Account',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.network(
                            'https://media.wired.com/photos/5926ffe47034dc5f91bed4e8/master/pass/google-logo.jpg',
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),

                          Text('Google', style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Image.network(
                            'https://pngdownload.io/wp-content/uploads/2023/12/Apple-Logo-Iconic-Tech-Brand-Symbol-PNG-Transparent-Representation-of-Innovation-and-Design-jpg.webp',
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),

                          Text('Apple', style: TextStyle(color: Colors.black)),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.black, thickness: 0.2)),
                  SizedBox(width: 10),
                  Text('OR'),
                  SizedBox(width: 10),
                  Expanded(child: Divider(color: Colors.black, thickness: 0.2)),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name'),
                        TextField(
                          controller: _firstnameController,
                          decoration: const InputDecoration(
                            hintText: "First Name",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Last Name'),
                        TextField(
                          controller: _lastnameController,
                          decoration: const InputDecoration(
                            hintText: "Last Name",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Email'),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(height: 20),
              Text('Password'),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey,
                        disabledForegroundColor: Colors.white,
                      ),
                      child: Text("Sign Up"),
                    ),
                  ),
                ],
              ),

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    "Already Have Account",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.orange, // 👈 underline color
                        decorationThickness: 3,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
