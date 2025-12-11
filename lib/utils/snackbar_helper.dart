import 'package:flutter/material.dart';

enum MessageType { success, error, info }

class SnackbarHelper {
  static void showModernMessage(
    BuildContext context,
    String message, {
    MessageType type = MessageType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;

    switch (type) {
      case MessageType.success:
        backgroundColor = Colors.green.shade600;
        break;
      case MessageType.error:
        backgroundColor = Colors.red.shade600;
        break;
      case MessageType.info:
      backgroundColor = Colors.blueGrey.shade700;
        break;
    }

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 60,
        left: 20,
        right: 20,
        child: AnimatedSlide(
          duration: Duration(milliseconds: 300),
          offset: Offset(0, 0),
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
