import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ADDWORKER extends StatefulWidget {
  const ADDWORKER({Key? key}) : super(key: key);

  @override
  State<ADDWORKER> createState() => _ADDWORKERState();
}

class _ADDWORKERState extends State<ADDWORKER> {
  final _formkey = GlobalKey<FormState>();

  submet() {
    _formkey.currentState!.validate();
    _formkey.currentState!.save();
  }

  TextEditingController _qatarid = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _passnumber = TextEditingController();
  TextEditingController _countryname = TextEditingController();
  TextEditingController _currentaddress = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _position = TextEditingController();

  writedata() async{
    CollectionReference data = await FirebaseFirestore.instance.collection('UserData');
    data.add({
      'id':_qatarid.text,
      'name':_fullname.text,
      'passport':_passnumber.text,
      'country':_countryname.text,
      'address':_currentaddress.text,
      'phone':_phonenumber.text,
      'position':_position.text,
    });
    print(data);
    _qatarid.clear();
    _fullname.clear();
    _passnumber.clear();
    _countryname.clear();
    _currentaddress.clear();
    _phonenumber.clear();
    _position.clear();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'Add Workers',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GoudyBookletter1911.otf"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Divider(
                thickness: 1.2,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _qatarid,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.black54,
                          ),
                          hintText: 'ID Number',
                          labelText: 'Qatar ID',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _fullname,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _passnumber,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.book_online_outlined,
                            color: Colors.black54,
                          ),
                          hintText: 'Passport Number',
                          labelText: 'Passport Number',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _countryname,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black54,
                          ),
                          hintText: 'Country Name',
                          labelText: 'Country Name',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _currentaddress,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black54,
                          ),
                          hintText: 'Current Address',
                          labelText: 'Current Address',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _phonenumber,
                        keyboardType: TextInputType.number,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.call,
                            color: Colors.red,
                          ),
                          hintText: 'Phone Number',
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          tileMode: TileMode.clamp,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      child: TextField(
                        controller: _position,
                        expands: false,
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12.0),
                          prefixIcon: Icon(
                            Icons.person_add_alt,
                            color: Colors.black54,
                          ),
                          hintText: 'Position',
                          labelText: 'Position',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: ()=>writedata(),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          color: Colors.white,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(8)),
                          //border: NeumorphicBorder()
                        ),
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontFamily: 'GoudyBookletter1911',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
