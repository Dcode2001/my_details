import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  int a = 0;

  SharedPreferences? prefs;


  @override
  void initState() {
    super.initState();

   getprefs();
  }

  getprefs()
  async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  a--;
                });
              }, child: Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

              Text("$a",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100),),

              ElevatedButton(onPressed: () {
                  setState(() {
                    a++;
                  });
              }, child: Text("+",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

              ElevatedButton(onPressed: () async {

                await prefs!.setInt('myval1', a);
                await prefs!.setInt('myval2', a*10);


              }, child: Text("Set",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),

              ElevatedButton(onPressed: () async {

                final int a = prefs!.getInt('myval1') ?? 0;
                final int b = prefs!.getInt('myval2') ?? 10;

                print(a);
                print(b);

              }, child: Text("Get",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
            ],
      )),
    );
  }
}
