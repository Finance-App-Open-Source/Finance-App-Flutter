import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class AppButton extends StatefulWidget {
  final Function()? onTab;
  final Widget child;
  AppButton({Key? key, this.onTab, required this.child}) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final button = ({required Widget child}) => Styled.widget(child: child)
        .padding(all: 10.0)
        .alignment(Alignment.center)
        .ripple()
        .clipRRect(all: 10.0)
        .decorated(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.red.withOpacity(_isPressed ? 0 : 0.5),
                blurRadius: 21,
                offset: Offset(0, 5),
              )
            ])
        .constrained(height: 55.0, width: screenSize.width)
        .gestures(
          onTap: widget.onTab,
          onTapChange: (tapStatus) => setState(() => _isPressed = tapStatus),
        )
        .scale(all: _isPressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    return button(child: widget.child);
  }
}
