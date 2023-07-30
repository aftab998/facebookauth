import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class auth extends StatefulWidget {
  const auth({Key? key}) : super(key: key);

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GestureDetector(
      onTap:() async{
        await login();
      },
        child: Center(
          child: Container(
            height: 60,
            width: 160,
            decoration:BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child:Text('Login with facebook',style:TextStyle(color:Colors.white)),
          ),
        ),
      ),
    );
  }
  Future<void> login() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final userData = await FacebookAuth.instance.getUserData();
        print('User Data: $userData');
      } else if (result.status == LoginStatus.cancelled) {
        print('Facebook login cancelled.');
      } else {
        print('Facebook login failed. Error code: ${result.status}');
      }
    } catch (e) {
      print('Error logging in with Facebook: $e');
    }
  }
}

