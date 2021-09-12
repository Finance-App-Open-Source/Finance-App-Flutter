import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onTab;
  final Widget child;
  AppButton({Key? key, this.onTab, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: this.onTab,
      child: Container(
        height: 55.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 21,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.0),
        width: screenSize.width,
        child: child,
      ),
    );
  }
}
