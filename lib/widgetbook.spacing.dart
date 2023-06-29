// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groceries_app/widgetbook.group.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'theme/theme.dart';

class LineContainer extends StatelessWidget {
  final double lineWidth;
  final double lineSpacing;

  const LineContainer({
    super.key,
    this.lineWidth = 2.0,
    this.lineSpacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: LinePainter(lineWidth: lineWidth, lineSpacing: lineSpacing),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double lineWidth;
  final double lineSpacing;

  LinePainter({
    required this.lineWidth,
    required this.lineSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE93EB0)
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double x = -max(size.width, size.height);
        x <= 2 * max(size.width, size.height);
        x += lineSpacing) {
      path.moveTo(x, 0);
      path.lineTo(x + size.height, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WidgetbookSpacing extends StatelessWidget {
  const WidgetbookSpacing({
    super.key,
    required this.spacing,
    required this.color,
    required this.label,
  });

  final String label;
  final double spacing;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(label),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          child: Text(
            spacing.toString(),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 24,
                height: 24,
              ),
              SizedBox(
                width: spacing,
                height: 24,
                child: const LineContainer(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 24,
                height: 24,
              ),
            ],
          ),
        )
      ],
    );
  }
}

@UseCase(name: 'Data', type: SpacingThemeData)
Widget buildWidgetbookSpacingUseCase(BuildContext context) {
  return WidgetbookGroup(
    label: 'Spacings',
    children: [
      WidgetbookSpacing(
        label: 'xs',
        spacing: 4,
        color: AppTheme.of(context).surface.primary,
      ),
      WidgetbookSpacing(
        label: 'md',
        spacing: 8,
        color: AppTheme.of(context).surface.primary,
      ),
      WidgetbookSpacing(
        label: 'xl',
        spacing: 16,
        color: AppTheme.of(context).surface.primary,
      ),
      WidgetbookSpacing(
        label: '3xl',
        spacing: 32,
        color: AppTheme.of(context).surface.primary,
      ),
    ],
  );
}
