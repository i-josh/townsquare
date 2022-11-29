import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Function() submit;
  final Color color;
  final Color textColor;
  final bool boldText;
  final IconData? icon;

  const SubmitButton(
      {Key? key,
      required this.isLoading,
      required this.label,
      required this.submit,
      required this.color,
      this.icon,
      this.textColor = Colors.white,
      this.boldText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : submit,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            )
          ],
          color: isLoading ? color.withOpacity(0.7) : color,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    ),
                  ),
                )
              : icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            color: textColor,
                            fontWeight:
                                boldText ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          icon,
                          color: Colors.white,
                        )
                      ],
                    )
                  : Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontWeight:
                            boldText ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
        ),
      ),
    );
  }
}
