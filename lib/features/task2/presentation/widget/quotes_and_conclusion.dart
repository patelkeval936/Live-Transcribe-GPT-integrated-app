import 'package:alindors_assignment/features/widgets/shadowed_container.dart';
import 'package:alindors_assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuotesAndConclusion extends StatelessWidget {
  const QuotesAndConclusion({
    super.key,
    required this.titleText,
    required this.text,
   this.alignment = Alignment.center,
  });
  final String titleText;
  final String text;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Align(
        alignment: alignment,
         child: Text(
            titleText,
            style: const TextStyle(
              color: Color(
                0xFF828282,
              ),
              fontSize: 15,
            ),
          ),
       ),
        const SizedBox(
          height: 12,
        ),
        ShadowedContainer(
          radius: 20,
          margin: 20,
          child: Container(
            alignment: Alignment.center,
            height: 44,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
