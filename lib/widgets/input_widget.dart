import 'package:flutter/material.dart';
import 'package:gorouter_and_sessions_activity/screens/login_screen.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    Key? key,
    required this.focusNode,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.suffixIcon,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final IconData? suffixIcon;

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool obscureText = true; // Initial state for password visibility
  late IconData currentSuffixIcon; // Track current suffix icon state

  @override
  void initState() {
    super.initState();
    currentSuffixIcon = widget.suffixIcon ??
        Icons.visibility; // Initialize with provided or default icon
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.isPassword && obscureText,
        decoration: InputDecoration(
          labelText: widget.isPassword ? 'Password' : 'Text',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText:
              widget.isPassword ? 'Enter your password' : 'Enter your text',
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.grey),
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.isPassword) {
                        obscureText =
                            !obscureText; // Toggle password visibility
                      }
                      // Change suffix icon
                      currentSuffixIcon =
                          obscureText ? Icons.visibility : Icons.visibility_off;
                    });
                  },
                  child: Icon(currentSuffixIcon),
                )
              : null,
        ),
      ),
    );
  }
}
