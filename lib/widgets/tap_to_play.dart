import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TapToPlay extends StatelessWidget {
  const TapToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
                    child: Text(
                          'TAP TO PLAY',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,

                            color: Color(0xff2387fc),
                            fontSize: 28,
                          ),
                        )
                        .animate(
                          onPlay:
                              (controller) => controller.repeat(reverse: true),
                        )
                        .scale(
                          begin: Offset(1.0, 1.0),
                          end: Offset(1.2, 1.2),
                          duration: Duration(milliseconds: 500),
                        ),
                  );
  }
}