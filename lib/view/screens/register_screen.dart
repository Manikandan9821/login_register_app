import 'package:flutter/material.dart';
import 'package:login_register_app/logics/provider/auth_provider.dart';
import 'package:login_register_app/logics/services/message.dart';
import 'package:login_register_app/utils/const.dart';
import 'package:login_register_app/utils/validators.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;
  String _name;
  String _password;
  String _confirmpassword;
  var _isLoading = false;

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _register() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<AuthProvider>(context, listen: false)
            .register(_email, _name, _password);
        Navigator.of(context).pushReplacementNamed('/');
      } on Message catch (e) {
        setState(() {
          _isLoading = false;
        });
        _showSnackBar(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('-----------------  Widget Build Tree  --------------------');
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Sign Up to Continue!',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          textFormField('EmailId', _email),
                          SizedBox(height: 20.0),
                          textFormField('Name', _name),
                          SizedBox(height: 20.0),
                          textFormField('Password', _password),
                          SizedBox(height: 20.0),
                          textFormField('Confirm Password', _confirmpassword),
                          SizedBox(height: 20.0),
                          if (_isLoading)
                            Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.redAccent,
                              ),
                            )
                          else
                            Container(
                              height: 50.0,
                              decoration: decoration,
                              width: double.infinity,
                              child: FlatButton(
                                onPressed: _register,
                                child: Text(
                                  'Register',
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
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'I\'m a new user.',
                      style: TextStyle(fontSize: 15.0),
                    ),

                    FlatButton(
                      padding: const EdgeInsets.only(right: 30.0),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 17.0,
                            color: Theme.of(context).primaryColor),
                      ),
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

  Widget textFormField(String title, String value) {
    final validate = Validations();
    return TextFormField(
      validator: (val) {
        if (title == 'Name') {
          return validate.validateName(val);
        } else if (title == 'EmailId') {
          return validate.validateEmail(val);
        } else if (title == 'Confirm Password') {
          return validate.validateConfirmPassword(val, _password);
        } else if (title == 'Password') {
          return validate.validatePassword(val);
        }
        return null;
      },
      onSaved: (val) {
        if (title == 'Name') {
          _name = val;
        } else if (title == 'EmailId') {
          _email = val;
        } else if (title == 'Password') {
          _password = val;
        } else if (title == 'Confirm Password') {
          _confirmpassword = val;
        }
      },
      decoration: InputDecoration(
        labelText: title,
        contentPadding: const EdgeInsets.all(15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: title,
      ),
      keyboardType:
          title == 'EmailId' ? TextInputType.emailAddress : TextInputType.text,
      obscureText:
          title == 'Confirm Password' || title == 'Password' ? true : false,
    );
  }
}
