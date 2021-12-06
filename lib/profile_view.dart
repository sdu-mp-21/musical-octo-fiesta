import 'package:BookStore/main.dart';
import 'package:BookStore/services/auth.dart';
import 'package:BookStore/view/home_view.dart';
import 'package:BookStore/view/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() {
    return new ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  String email;
  String password;

  doLogin() async {
    if(_email.text.isEmpty || _password.text.isEmpty) {
      setState(() {
        _validate = true;
      });
    } else {
      setState(() {
        _validate = false;
      });
      try {
        String token = await login(this.email, password);
        setToken(token);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage()));
        print("Successful login");
      } catch (err) {
        Fluttertoast.showToast(
            msg: "Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50.0,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 95,
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onChanged: (email) {
                    this.email = email;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onChanged: (password) {
                    this.password = password;
                  },
                ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MaterialButton(
                    onPressed: () => doLogin(),
                    color: Colors.blue,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.black,
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '''Don't have an account? ''',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Registration()));
                      },
                      child: Text('Register Now',
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
