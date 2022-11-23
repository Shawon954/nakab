import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nakab/Database/firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();

  bool _obscureText = true;


 late String _password;

 submithundel(){
   _formkey.currentState!.validate();
   _formkey.currentState!.save();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Column(
            children: [

              Text('Sing In', style: TextStyle(
                  fontSize: 36,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GoudyBookletter1911.otf'),),

              SizedBox(height:30,),

              Form(
                key: _formkey,
                child: Container(
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
                  child: TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20.0, color: Colors.black54),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black54,
                      ),

                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                    ),
                    validator: (val) => val!.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val!,
                  ),
                ),
              ),
              SizedBox(height:15,),
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
                child: TextFormField(
                  controller: _passcontroller,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20.0, color: Colors.black54),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),

                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black54,
                    ),
                    suffixIcon: new GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child:
                      new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    ),


                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    hintStyle: TextStyle(color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),
                  validator: (val){
                    if(val!.isEmpty){
                      return 'Password Empty';
                    }
                    if(val!= _passcontroller.text){
                      return 'Match';
                    }
                    else(
                    Text('Worng Password')
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(height: 15,),
              TextButton(
                  child: Text('Forget Password ?', style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                      fontFamily: 'GoudyBookletter1911.otf'),),
                  onPressed: (){},
                  ),
              SizedBox(
                width: 200,
                child: NeumorphicButton(
                  margin: EdgeInsets.only(top: 12),
                  onPressed: (){

                    var useremail = _emailcontroller.text;
                    var userpass = _passcontroller.text;
                   final obj = AuthData();
                   obj.Singin(useremail,userpass);


                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    color: Colors.white,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontFamily: 'GoudyBookletter1911.otf',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
