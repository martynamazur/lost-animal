import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getMarkerFromUrl(String url, {int width = 30}) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;

  final codec = await ui.instantiateImageCodec(bytes, targetWidth: width);
  final frame = await codec.getNextFrame();
  final resized = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(resized!.buffer.asUint8List());
}

Future<BitmapDescriptor> createCustomMarkerWithRoundedImage(
  String type,
  String imageUrl, {
  int size = 60,
  double borderRadius = 30,
  Color backgroundColor = Colors.white,
  double borderWidth = 4,
}) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  final paint = Paint();

  // białe koło z obramowaniem
  final center = Offset(size / 2, size / 2);
  final radius = size / 2;

  paint.color = backgroundColor;
  canvas.drawCircle(center, radius, paint);

  Color borderColor = type == 'missing' ? Colors.red : Colors.green;

  if (borderWidth > 0) {
    paint.color = borderColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = borderWidth;
    canvas.drawCircle(center, radius - borderWidth / 2, paint);
  }

  final response = await http.get(Uri.parse(imageUrl));
  final imageBytes = response.bodyBytes;
  final codec = await ui.instantiateImageCodec(imageBytes, targetWidth: size);
  final frame = await codec.getNextFrame();
  final image = frame.image;

  final padding = borderWidth + 6; // lekki odstęp od krawędzi
  final rect = Rect.fromLTWH(
    padding,
    padding,
    size - padding * 2,
    size - padding * 2,
  );

  final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

  canvas.save();
  canvas.clipRRect(rrect);

  paintImage(canvas: canvas, rect: rect, image: image, fit: BoxFit.cover);
  canvas.restore();

  final picture = recorder.endRecording();
  final img = await picture.toImage(size, size);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}
