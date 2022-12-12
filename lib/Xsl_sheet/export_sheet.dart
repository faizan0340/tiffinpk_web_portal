import 'package:flutter/material.dart';

class ExportSheet extends StatefulWidget {
  const ExportSheet({Key? key}) : super(key: key);

  @override
  State<ExportSheet> createState() => _ExportSheetState();
}

class _ExportSheetState extends State<ExportSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


      //user activate and block accounts  button ui
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
             ElevatedButton.icon(
              icon: const Icon(Icons.person_add, color: Colors.white,),
             label: Text(
              "Rider".toUpperCase(),
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
              // Navigator.push(context, MaterialPageRoute(builder: (c)=> const VerifiedAccount()));
            },
          ),
          const SizedBox(
              width:20
          ),
          // block
          ElevatedButton.icon(
            icon: const Icon(Icons.block_flipped, color: Colors.white,),
            label: Text(
              "portal".toUpperCase(),
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
              // Navigator.push(context, MaterialPageRoute(builder: (c)=> const BlockedUsersAccount()));
            },
           ),
           ]
           ),

          ],

       ),
      ),
    );
  }
}
