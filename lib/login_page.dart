import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.grey[600],
              decoration: TextDecoration.none,
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              top: 20.0,
            ),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Correo electrónico',
                    icon: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              top: 20.0,
            ),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Contraseña',
                  icon: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.vpn_key,
                      color: Colors.grey[400],
                    ),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
