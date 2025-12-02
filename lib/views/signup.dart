import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 120),

          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Signup",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Text("Create a new account and get started"),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "email cannot be empty." : null,
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text("Email"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: TextFormField(
              validator: (value) => value!.length < 8
                  ? "password cannot have less than 8 charecters"
                  : null,
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: Text("Password"),
              ),
            ),
          ),
          SizedBox(height: 10),

          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * .9,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Sign up", style: TextStyle(fontSize: 16)),
            ),
          ),
          SizedBox(height: 10),
 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ALready have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Login"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
