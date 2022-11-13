import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFild extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;
  final String? inicialValue;
  final bool reedOnly;

  const CustomTextFild({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatter,
    this.inicialValue,
    this.reedOnly = false,
  });

  @override
  State<CustomTextFild> createState() => _CustomTextFildState();
}

class _CustomTextFildState extends State<CustomTextFild> {
  bool isObsucre = false;
  @override
  void initState() {
    super.initState();
    isObsucre = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: widget.reedOnly,
        initialValue: widget.inicialValue,
        inputFormatters: widget.inputFormatter,
        obscureText: isObsucre,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObsucre = !isObsucre;
                    });
                  },
                  icon:
                      Icon(isObsucre ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
