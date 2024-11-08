import 'package:flutter/material.dart';

import '../../../../common/utils/context_extension.dart';

class Hangman extends CustomPainter {
  const Hangman({required this.context});

  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    const double headRadius = 40;
    const double bodySize = 70;

    final center = size / 2;
    final headOffset = Offset(
      center.width,
      center.height - headRadius,
    );

    final bodyOffsetStart = Offset(
      center.width,
      center.height + headRadius - headRadius,
    );
    final bodyOffsetEnd = Offset(
      center.width,
      center.height + headRadius + bodySize - headRadius,
    );

    final legOffsetStart = Offset(
      center.width,
      center.height + headRadius + bodySize - headRadius,
    );
    final leg1OffsetEnd = Offset(
      center.width - headRadius,
      center.height + headRadius * 2 + bodySize - headRadius,
    );
    final leg2OffsetEnd = Offset(
      center.width + headRadius,
      center.height + headRadius * 2 + bodySize - headRadius,
    );

    final handOffsetStart = Offset(
      center.width,
      center.height + bodySize / 1 - headRadius,
    );
    final hand1OffsetEnd = Offset(
      center.width - headRadius,
      center.height + bodySize / 2 - headRadius,
    );
    final hand2OffsetEnd = Offset(
      center.width + headRadius,
      center.height + bodySize / 2 - headRadius,
    );

    // place
    const double rectWidth = 237;
    const double rectHeight = 60;
    final rect = Rect.fromLTWH(
      24,
      rectWidth,
      size.width - 48,
      rectHeight,
    );
    final ropeOffsetStart = Offset(
      center.width / 3,
      center.height * 2 - rectHeight,
    );
    final ropeOffsetEnd = Offset(
      center.width / 3,
      center.height - rectHeight * 2,
    );
    final rope2OffsetStart = Offset(
      center.width / 3,
      center.height - rectHeight * 2,
    );
    final rope2OffsetEnd = Offset(
      center.width,
      center.height - rectHeight * 2,
    );
    final rope3OffsetStart = Offset(
      center.width,
      center.height - rectHeight * 2,
    );
    final rope3OffsetEnd = Offset(
      center.width,
      center.height - headRadius * 2,
    );

    final Paint paint = Paint()
      ..color = context.colors.onSecondaryContainer
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint paint2 = Paint()
      ..color = context.colors.secondaryFixed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawRect(rect, paint);
    canvas.drawLine(ropeOffsetStart, ropeOffsetEnd, paint);
    canvas.drawLine(rope2OffsetStart, rope2OffsetEnd, paint);
    canvas.drawLine(rope3OffsetStart, rope3OffsetEnd, paint);

    canvas.drawCircle(headOffset, headRadius, paint2);
    canvas.drawLine(bodyOffsetStart, bodyOffsetEnd, paint2);
    canvas.drawLine(legOffsetStart, leg1OffsetEnd, paint2);
    canvas.drawLine(legOffsetStart, leg2OffsetEnd, paint2);
    canvas.drawLine(handOffsetStart, hand1OffsetEnd, paint2);
    canvas.drawLine(handOffsetStart, hand2OffsetEnd, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
