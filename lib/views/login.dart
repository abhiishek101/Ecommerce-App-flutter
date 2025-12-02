import 'package:ecommerce_admin_app/controllers/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(height: 120),

            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                  ),
                  Text("Get started with your account"),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("forget password")),
              ],
            ),

            SizedBox(height: 10),

            //LOGIN BUTTON
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * .9,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    AuthService()
                        .loginWithEmail(
                          _emailController.text,
                          _passwordController.text,
                        )
                        .then((value) {
                          if (value == "Login Successful") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Successful"),
                              ),
                            );
                            Navigator.restorablePushNamedAndRemoveUntil(context, "/homw", (route)=>false);
                          }
                        });
                  }
                },
                child: Text("login", style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
