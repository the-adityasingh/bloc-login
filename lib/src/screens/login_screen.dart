import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          phoneField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(context),
        ],
      ),
    );
  }

  Widget phoneField() {
    return StreamBuilder(
      stream: bloc.phone,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePhone,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter your phone no',
            labelText: 'Phone',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(BuildContext context) {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.lightBlue,
      onPressed: () {
        final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}
