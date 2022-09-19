import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_details/DbHelper.dart';
import 'package:my_details/view.dart';

class firstpage extends StatefulWidget {
  // const firstpage({Key? key}) : super(key: key);

  Map? m;

  firstpage({this.m});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String gvalue = "";
  String? _selectedLocation;
  bool _password = true;
  bool _password1 = true;

  /* bool C = false;
  bool Cplusplus = false;
  bool JAVA = false;
  bool DART = false;
  bool FLUTTER = false;
*/
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _pass1 = TextEditingController();
  TextEditingController _hobby = TextEditingController();
  TextEditingController _city = TextEditingController();


  Database? db;

  @override
  void initState() {
    super.initState();

    DbHelper().createDataBase().then((value) {
      db = value;
    });

    if (widget.m != null) {
      _name.text = widget.m!['name'];
      _contact.text = widget.m!['contact'];
      _email.text = widget.m!['email'];
      _pass.text = widget.m!['password'];
      _pass1.text = widget.m!['confirmpassword'];
      gvalue = widget.m!['gender'];
      _hobby.text = widget.m!['hobby'];
      _city.text = widget.m!['city'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(title: Text("My Details"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _name,
                  cursorHeight: 30,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      helperText: "Enter First Character in Capital",
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_circle_rounded, size: 30))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _email,
                  cursorHeight: 30,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email-id",
                      helperText: "Enter Your Email Id",
                      prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.email))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _contact,
                  cursorHeight: 30,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mobile Number",
                      helperText: "Enter Your Mobile Number",
                      prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.phone))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _pass,
                  obscureText: _password,
                  cursorHeight: 30,
                  keyboardType: TextInputType.name,
                  maxLength: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      helperText: "Create Your Password",
                      prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _password = !_password;
                            });
                          },
                          icon: Icon(_password
                              ? Icons.visibility_off
                              : Icons.visibility))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _pass1,
                    obscureText: _password1,
                    cursorHeight: 30,
                    keyboardType: TextInputType.name,
                    maxLength: 8,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Confirm Your Password",
                        helperText: "Enter Your Password",
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.lock_outline_sharp)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _password1 = !_password1;
                              });
                            },
                            icon: Icon(_password1
                                ? Icons.visibility_off
                                : Icons.visibility)))),
                SizedBox(
                  height: 0,
                ),
                Row(
                  children: [
                    Text(
                      "Gender :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Male",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Male",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Female",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Female",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          gvalue = value.toString();
                        });
                      },
                      value: "Others",
                      groupValue: gvalue,
                    ),
                    Text(
                      "Others",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _hobby,
                  cursorHeight: 30,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Hobby",
                      helperText: "Enter Your Hobby",
                      prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outlined))),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "City :",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      hint: Text('Select Your City'),
                      value: _selectedLocation,
                      items: <String>['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot','Bhavnagar','Jamnagar','Gandhinagar','Junagadh'].map((String value) {
                        return DropdownMenuItem<String>(

                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                    ),
                  ],
                ),
                // SizedBox(height: 20),

                // SizedBox(
                //   height: 2,
                // ),

                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String name = _name.text;
                      String contact = _contact.text;
                      String email = _email.text;
                      String password = _pass.text;
                      String conpass = _pass1.text;
                      String hobbie = _hobby.text;
                      String city = _city.text;

                      if (widget.m == null) {
                        String qry =
                            "insert into Test (name,email,contact,password,confirmpassword,gender,hobby,city) values('$name','$email','$contact','$password','$conpass','$gvalue','$hobbie','$city')";

                        int a = await db!.rawInsert(qry);

                        print(a);

                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return viewpage();
                          },
                        ));
                      } else {
                        int id = widget.m!['id'];

                        String qry =
                            "update Test set name='$name',email='$email',contact='$contact',password='$password',confirmpassword='$conpass',gender='$gvalue',hobby='$hobbie',city='$city' where id = '$id'";

                        int a = await db!.rawUpdate(qry);

                        print(a);

                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return viewpage();
                          },
                        ));
                      }
                    },
                    child: Text(
                      widget.m != null ? "SUBMIT" : "Save",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ),
    ), onWillPop: goback);
  }


  Future<bool> goback() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return viewpage();
    },));
    return Future.value();
  }
}
/*  Demo on Textfiled ->
*
*             TextField(
              obscureText: false,
              // textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              textDirection: TextDirection.ltr,
              textCapitalization: TextCapitalization.words,
              // maxLength: 10 ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                  // errorText: "Enter Your Full Name",
                  hintText: "Username",
                  helperText: "Enter First Character in Capital",
                  fillColor: Colors.black12,
                  filled: true,
                  prefix: Text("Mr. "),
                  // prefixText:  "hello",
                // iconColor: Colors.black,
                  prefixIcon: IconButton(onPressed: () {

                  }, icon: Icon(Icons.email_outlined,),
              ),
                suffix: IconButton(onPressed: () {

                }, icon: Icon(Icons.visibility))
            ),
            ),
 */



/*
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:submissionform/DbHelper.dart';
import 'package:submissionform/viewpage.dart';

class firstpage extends StatefulWidget {
  // const firstpage({Key? key}) : super(key: key);

  Map? m;


  firstpage({this.m});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  String gvalue = "Male";

  bool _password = true;
  bool _password1 = true;

  bool C = false;
  bool Cplusplus = false;
  bool JAVA = false;
  bool DART = false;

  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();

  Database? db;


  @override
  void initState() {
    super.initState();

    DbHelper().createDatabase().then((value)
    {
          db = value;
    }
    );

    if(widget.m != null)
      {
              _name.text =widget.m!['name'];
              _contact.text =widget.m!['contact'];
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SUBMISSION FORM")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _name,
                cursorHeight: 30,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    helperText: "Enter First Character in Capital",
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.account_circle_rounded, size: 30))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorHeight: 30,
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email-id",
                    helperText: "Enter Your Email Id",
                    prefixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.email))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _contact,
                cursorHeight: 30,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile Number",
                    helperText: "Enter Your Mobile Number",
                    prefixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.phone))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: _password,
                cursorHeight: 30,
                keyboardType: TextInputType.name,
                maxLength: 8,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    helperText: "Create Your Password",
                    prefixIcon:
                    IconButton(onPressed: () {
                    }, icon: Icon(Icons.lock)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _password = !_password;
                          });
                        }, icon: Icon(_password?Icons.visibility_off:Icons.visibility))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  obscureText: _password1,
                  cursorHeight: 30,
                  keyboardType: TextInputType.name,
                  maxLength: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText
                          : "Confirm Your Password",
                      helperText: "Enter Your Password",
                      prefixIcon: IconButton(onPressed: () {

                      }, icon: Icon(Icons.lock_outline_sharp)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _password1 = !_password1;
                            });
                          }, icon: Icon(_password1?Icons.visibility_off:Icons.visibility)))),
              SizedBox(
                height: 0,
              ),
              Row(
                children: [
                  Text(
                    "Gender :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        gvalue = value.toString();
                      });
                    },
                    value: "Male",
                    groupValue: gvalue,
                  ),
                  Text(
                    "Male",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        gvalue = value.toString();
                      });
                    },
                    value: "Female",
                    groupValue: gvalue,
                  ),
                  Text(
                    "Female",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Radio(
                    onChanged: (value) {
                      setState(() {
                        gvalue = value.toString();
                      });
                    },
                    value: "Others",
                    groupValue: gvalue,
                  ),
                  Text(
                    "Others",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),

              // SizedBox(
              //   height: 2,
              // ),

              SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        "Languages :",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: [
                                Checkbox(
                                  onChanged: (value) {
                                    // print(value);
                                    setState(() {
                                      C = value!;
                                    });
                                  },
                                  value: C,
                                ),
                                Text(
                                  "C Language",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Checkbox(
                                  onChanged: (value) {
                                    // print(value);
                                    setState(() {
                                      Cplusplus = value!;
                                    });
                                  },
                                  value: Cplusplus,
                                ),
                                Text(
                                  "C++ Language",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Checkbox(
                                  onChanged: (value) {
                                    // print(value);
                                    setState(() {
                                      JAVA = value!;
                                    });
                                  },
                                  value: JAVA,
                                ),
                                Text(
                                  "JAVA Language",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Checkbox(
                                  onChanged: (value) {
                                    // print(value);
                                    setState(() {
                                      DART = value!;
                                    });
                                  },
                                  value: DART,
                                ),
                                Text(
                                  "DART Language",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ]),
                        ),
                      ), // CheckboxListTile(value: value, onChanged: onChanged)
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async{

                    String name = _name.text;
                    String contact = _contact.text;

                    if(widget.m != null) {
                      String qry = "insert into test (name,contact) values('$name','$contact')";

                      int a = await db!.rawInsert(qry);

                      print(a);

                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) {
                        return viewpage();
                      },));
                    }
                    else
                      {
                        int id = widget.m!['id'];

                        String qry = "update test set name='$name',contact='$contact' where id = '$id'";

                        int a = await db!.rawUpdate(qry);

                        print(a);

                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return viewpage();
                        },));
                      }
                  },
                  child: Text(
                    widget.m != null ? "SUBMIT" : "Save",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

*/
/*  Demo on Textfiled ->
*
*             TextField(
              obscureText: false,
              // textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              textDirection: TextDirection.ltr,
              textCapitalization: TextCapitalization.words,
              // maxLength: 10 ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                  // errorText: "Enter Your Full Name",
                  hintText: "Username",
                  helperText: "Enter First Character in Capital",
                  fillColor: Colors.black12,
                  filled: true,
                  prefix: Text("Mr. "),
                  // prefixText:  "hello",
                // iconColor: Colors.black,
                  prefixIcon: IconButton(onPressed: () {

                  }, icon: Icon(Icons.email_outlined,),
              ),
                suffix: IconButton(onPressed: () {

                }, icon: Icon(Icons.visibility))
            ),
            ),
 *//*


*/


/*
import 'package:flutter/material.dart';
import 'package:my_details/DbHelper.dart';
import 'package:my_details/view.dart';
import 'package:sqflite/sqflite.dart';

class insertpage extends StatefulWidget {

  Map? m;

  insertpage({this.m});

  @override
  State<insertpage> createState() => _insertpageState();
}

class _insertpageState extends State<insertpage> {

  String gvalue = "";

  bool _password = true;
  bool _password1 = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _pass1 = TextEditingController();
  TextEditingController _hobby = TextEditingController();

  String? _selectedLocation;

  Database? db;


  @override
  void initState() {
    super.initState();

    DbHelper().createDataBase().then((value)
        {
              db = value;
        }

    );
    if (widget.m != null) {
      _name.text = widget.m!['name'];
      _contact.text = widget.m!['contact'];
      _email.text = widget.m!['email'];
      _pass.text = widget.m!['password'];
      _pass1.text = widget.m!['confirmpassword'];
      gvalue = widget.m!['gender'];
      _hobby = widget.m!['hobby'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fill Details")),
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _name,
              cursorHeight: 30,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  helperText: "Enter First Character in Capital",
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_circle_rounded, size: 30))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              cursorHeight: 30,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email-id",
                  helperText: "Enter Your Email Id",
                  prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.email))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _contact,
              cursorHeight: 30,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mobile Number",
                  helperText: "Enter Your Mobile Number",
                  prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.phone))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _pass,
              obscureText: _password,
              cursorHeight: 30,
              keyboardType: TextInputType.name,
              maxLength: 8,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  helperText: "Create Your Password",
                  prefixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _password = !_password;
                        });
                      },
                      icon: Icon(_password
                          ? Icons.visibility_off
                          : Icons.visibility))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: _pass1,
                obscureText: _password1,
                cursorHeight: 30,
                keyboardType: TextInputType.name,
                maxLength: 8,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Your Password",
                    helperText: "Enter Your Password",
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.lock_outline_sharp)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _password1 = !_password1;
                          });
                        },
                        icon: Icon(_password1
                            ? Icons.visibility_off
                            : Icons.visibility)))),
            SizedBox(
              height: 0,
            ),
            Row(
              children: [
                Text(
                  "Gender :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Radio(
                  onChanged: (value) {
                    setState(() {
                      gvalue = value.toString();
                    });
                  },
                  value: "Male",
                  groupValue: gvalue,
                ),
                Text(
                  "Male",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Radio(
                  onChanged: (value) {
                    setState(() {
                      gvalue = value.toString();
                    });
                  },
                  value: "Female",
                  groupValue: gvalue,
                ),
                Text(
                  "Female",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Radio(
                  onChanged: (value) {
                    setState(() {
                      gvalue = value.toString();
                    });
                  },
                  value: "Others",
                  groupValue: gvalue,
                ),
                Text(
                  "Others",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _hobby,
              cursorHeight: 30,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Hobby",
                  helperText: "Enter Your Hobby",
                  prefixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outlined))),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "City :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 20),
                DropdownButton<String>(
                  hint: Text('Select Your City'),
                  value: _selectedLocation,
                  items: <String>['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot','Bhavnagar','Jamnagar','Gandhinagar','Junagadh'].map((String value) {
                    return DropdownMenuItem<String>(

                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed: () async{

              String name = _name.text;
              String contact = _contact.text;
              String email = _email.text;
              String password = _pass.text;
              String conpass = _pass1.text;
              String hobby = _hobby.text;
              String gender = gvalue;

              if (widget.m == null) {
                String qry =
                    "insert into Test (name,email,contact,password,confirmpassword,gender,hobby) values('$name','$email','$contact','$password','$conpass','$gender','$_hobby')";

                int a = await db!.rawInsert(qry);

                print(a);

                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return viewpage();
                  },
                ));
              } else {
                int id = widget.m!['id'];

                String qry =
                    "update Test set name='$name',email='$email',contact='$contact',password='$password',confirmpassword='$conpass',gender='$gender',hobby=$hobby where id = '$id'";

                int a = await db!.rawUpdate(qry);

                print(a);

                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return viewpage();
                  },
                ));
              }
            }, child:  Text(
              widget.m != null ? "SUBMIT" : "Save",
              style: TextStyle(fontSize: 18),
            ))
          ],
        ),
      ))),
    );
  }
}

*/
