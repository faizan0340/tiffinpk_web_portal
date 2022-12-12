import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiffinpk_web_portal/Xsl_sheet/export_sheet.dart';
import 'package:tiffinpk_web_portal/authentication/login_screen.dart';
import 'package:tiffinpk_web_portal/sellers/all_blocked_sellers_screen.dart';
import 'package:tiffinpk_web_portal/sellers/all_verified_sellers_screen.dart';
import 'package:tiffinpk_web_portal/users/blocked_user.dart';
import 'package:tiffinpk_web_portal/users/verified_account.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time)
  {
    return  DateFormat("hh:mm:ss a").format(time);
  }
  String formatCurrentDate(DateTime date)
  {
    return  DateFormat("dd MMMM, yyyy").format(date);
  }

   getCurrentLiveTime()
   {
     final DateTime timeNow = DateTime.now();
     final String liveTime = formatCurrentLiveTime(timeNow);
     final String  liveDate = formatCurrentDate(timeNow);

     if(this.mounted)
       {
         setState(() {
           timeText = liveTime;
           dateText = liveDate;
         });
       }
   }
  @override
  void initState()
  {
     super.initState();

     //time
   timeText = formatCurrentLiveTime(DateTime.now());

    //date
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            gradient: const LinearGradient(
              colors: [
                Colors.green,
                Colors.green,

              ],
              begin: FractionalOffset(0,0),
              end:  FractionalOffset(1,0),
            ),
          ),
        ),
        title: const Text(
          "  Tiffan.pk ",
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                timeText + "\n" + dateText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //user activate and block accounts  button ui
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Activate Users Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                     backgroundColor: Colors.green,

                  ),

                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const VerifiedAccount()));
                  },
                ),
                const SizedBox(
                  width:20
                ),
                // block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Block Users Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const BlockedUsersAccount()));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // 2nd row for ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Activate sellers  Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,

                  ),

                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedSellersScreen()));
                  },
                ),
                const SizedBox(
                    width:20
                ),
                // block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Block seller  Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedSellersScreen()));
                  },
                ),
              ],
            ),

            // riders app ui pnel
            const SizedBox(
              height: 30,
            ),
            // 2nd row for ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.white,),
                  label: Text(
                    "Activate Riders  Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,

                  ),

                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (c)=> const ActiveRiders()));

                  },
                ),
                const SizedBox(
                    width:20
                ),
                // block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.white,),
                  label: Text(
                    "Block Riders Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (c)=> const BlockedRiders()));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.white,),
                  label: Text(
                    "Logout".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,

                  ),

                  onPressed: ()
                  {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const  LoginScreen()));
                  },
                ),

                const SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.download, color: Colors.white,),
                  label: Text(
                    "Export Xls".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40),
                    backgroundColor: Colors.green,

                  ),

                  onPressed: ()
                  {

                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const  ExportSheet()));
                  },
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
