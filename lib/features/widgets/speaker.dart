import 'package:flutter/material.dart';

class AboutSpeaker extends StatelessWidget {
  const AboutSpeaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Small quote of Speaker1'),
        const SizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF8AEBFF),
              child: Image.asset('asset/graph.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personality Score'),
                Text.rich(
                  TextSpan(
                    text: '8',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '/10',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ],
    );
  }
}
