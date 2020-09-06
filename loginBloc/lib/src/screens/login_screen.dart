import "package:flutter/material.dart";
import 'package:loginBloc/src/blocs/bloc.dart';
//import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          buttonSubmit(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (newValue) {
              bloc.changeEmail(newValue);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@email.com',
              labelText: "Email",
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (value) => bloc.changePassword(value),
            obscureText: true,
            decoration: InputDecoration(
              hintText: '******',
              labelText: "password",
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget buttonSubmit(Bloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.submit,
        builder: (context, snapshot) {
          return RaisedButton(
            onPressed: snapshot.hasData
                ? () {
                    print('helo !');
                  }
                : null,
            child: Text('Button !'),
          );
        });
  }
}
