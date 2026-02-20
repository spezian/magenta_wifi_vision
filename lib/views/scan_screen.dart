import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/views/heatmap_screen.dart';
import 'package:magenta_wifi_vision/widgets/dialog.dart';
import 'package:magenta_wifi_vision/widgets/filled_button.dart';
import 'package:magenta_wifi_vision/widgets/scan_button.dart';
import 'package:magenta_wifi_vision/widgets/text_form_field.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.max,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  void showNameSavingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: _formKey,
          // -> We give it a key so that we can validate the Form later in a button.
          child: MagentaDialog(
            title: Text("Name your room"),
            showBackChevron: true,
            content: MagentaTextFormField(
              hintText: "Name",
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text.";
                }

                return null;
              },
            ),
            actions: [
              MagentaFilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HeatmapScreen(),
                      ),
                      (Route<dynamic> route) => route.isFirst,
                    );
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return MagentaDialog(
          title: Text("Room Complete"),
          content: Text("Do you want to finish the scan?"),
          actions: [
            MagentaFilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                showNameSavingDialog();
              },
              child: Text("Yes"),
            ),
            MagentaFilledButton(
              onPressed: () => Navigator.of(context).maybePop(),
              color: .black,
              child: Text("No"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    return Scaffold(
      // Disallowing keyboard to resize scaffold.
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                    child: Transform.scale(
                      scale: _controller.value.aspectRatio / deviceRatio,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                            child: CameraPreview(_controller)
                        )
                    )
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          // Back button
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: Padding(
                padding: const .only(left: 12.0),
                child: ScanButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: Icon(Icons.chevron_left, size: 48.0),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: .center,
                spacing: 16.0,
                children: [
                  // Switch object
                  Padding(
                    padding: const .only(bottom: 48.0),
                    child: ScanButton(
                      onPressed: () {},
                      padding: .all(12.0),
                      icon: Icon(Icons.house, size: 42.0),
                    ),
                  ),

                  // Add object / Save map
                  Padding(
                    padding: const .only(bottom: 128.0),
                    child: ScanButton(
                      onPressed: () => showConfirmationDialog(),
                      padding: .all(24.0),
                      icon: Icon(Icons.crop_square_rounded, size: 62.0),
                    ),
                  ),

                  // Undo
                  Padding(
                    padding: const .only(bottom: 48.0),
                    child: ScanButton(
                      onPressed: () {},
                      padding: .all(12.0),
                      icon: Icon(Icons.undo, size: 42.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
