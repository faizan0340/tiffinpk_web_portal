import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String adminEmail = "";
  String adminPassword ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // image
                  Image.asset(
                     "images/admin.png"
                  ),

                  TextField(
                    onChanged: (value)
                    {
                      adminEmail =value;
                    },
                    style: const TextStyle ( fontSize: 16, color: Colors.green),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                          color:  Colors.purple,
                          width: 2,
                        )
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.green),
                      icon: Icon(
                        Icons.email,
                        color:Colors.green,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  TextField(
                    onChanged: (value)
                    {
                      adminPassword =value;
                    },
                    obscureText: true,
                    style: const TextStyle ( fontSize: 16, color: Colors.green),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                            color:  Colors.purple,
                            width: 2,
                          )
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.green),
                      icon: Icon(
                        Icons.lock,
                        color:Colors.green,
                      ),
                    ),
                  ),

                const SizedBox(
                  height: 10,
                ),

                  // button login
                  ElevatedButton(
                    onPressed: ()
                    {

                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
