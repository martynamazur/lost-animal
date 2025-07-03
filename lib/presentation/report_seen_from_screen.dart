import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lostanimal/presentation/widget/build_image_gallery.dart';
import 'package:lostanimal/presentation/widget/category.dart';
import 'package:lostanimal/presentation/widget/description.dart';

class ReportSeenFromScreen extends ConsumerStatefulWidget {
  const ReportSeenFromScreen({super.key});

  @override
  ConsumerState createState() => _ReportSeenFromScreenState();
}

class _ReportSeenFromScreenState extends ConsumerState<ReportSeenFromScreen> {
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
            key: keyForm,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BuildImageGallery(),
                    Category(),
                    Description((value){},'Description')

                  ],
                ),
              )
          )
      ),
    );
  }
}
