import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_one/registerpage.dart';

import 'Login_model/req/Login_req_model.dart';
import 'Login_model/res/Login_res_model.dart';
import 'auth_services.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    _emailController.text = "";
    _passwordController.text = "";
    super.initState();
  }

  // void login() {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //   if (email.isEmpty || password.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Please enter email and password")),
  //     );
  //     return;
  //   }
  //   Navigator.pushReplacement(
  //     context,
  //     CupertinoPageRoute(builder: (context) => HomePage(email: email)),
  //   );
  // }

  Future<void> login() async {

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    try {
      // Optional: Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      LoginReqModel loginReqModel = LoginReqModel(
        userName: email,
        pwd: password,
      );

      final LoginResModel user = await AuthServices().getLogin(loginReqModel);

      Navigator.pop(context); // close loading indicator

      if (user.isSuccess == true)
      {
        // ✅ Navigate only if login success
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (context) => HomePage(email: email)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(user.errorMessage ?? "Login failed")),
        );
      }
    } catch (e) {
      Navigator.pop(context); // close loading if error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
    finally{
      FocusScope.of(context).unfocus();

    }
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
                'Welcome Back !',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Enter Your Login Information',
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text("Remember Me", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: login,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey,
                        disabledForegroundColor: Colors.white,
                      ),
                      child: Text("Login"),
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
                    "Don't Have an account",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
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
