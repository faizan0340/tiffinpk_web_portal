import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiffinpk_web_portal/main_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  String adminEmail = "";
  String adminPassword ="";

  allowAdminToLogin()  async
  {
    SnackBar snackBar = const SnackBar(
      content: Text(
        "Checking Credentials, Please Wait....",
        style:  TextStyle(
          fontSize: 36,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
      duration:   Duration(seconds: 6),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);


    User? currentAdmin;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email:adminEmail,
        password:adminPassword,
    ).then((fAuth)
    {
         currentAdmin = fAuth.user;

     } ).catchError((onError)
    {

      final snackBar = SnackBar(
        content: Text(
          "Error Occured" + onError.toString(),
          style: const TextStyle(
            fontSize: 36,
            color: Colors.white,
          ),
        ),
         backgroundColor: Colors.green,
        duration: const  Duration(seconds: 5),
      );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    if(currentAdmin != null)
      {
       // check admin record  in firestore
       await FirebaseFirestore.instance.collection("admins").doc(currentAdmin !.uid).get().then((snap)
           {
             if(snap.exists)
               {
                 Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
               }
             else
             {
               final snackBar = SnackBar(
                 content: Text(
                   "No Record Found, You Are Not Admin",
                   style: const TextStyle(
                     fontSize: 36,
                     color: Colors.white,
                   ),
                 ),
                 backgroundColor: Colors.green,
                 duration: const  Duration(seconds: 5),
               );
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             }
           });
      }
  }

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
                      allowAdminToLogin();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Text(
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
