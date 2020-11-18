import 'package:flutter/material.dart';
import 'package:login_register_app/logics/provider/auth_provider.dart';
import 'package:login_register_app/utils/const.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    print('----------------- Widget Build Tree  -------------------- ');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter login Register'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text('Welcome',style: Theme.of(context).textTheme.headline6,),

              SizedBox(height: 20.0,),

              Text('${auth.userName}',style: Theme.of(context).textTheme.headline1,),

              SizedBox(height: 20.0,),

              Container(
                decoration: decoration,
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('/');
                    auth.logout();
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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
