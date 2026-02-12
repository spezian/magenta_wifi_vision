import 'package:ar_flutter_plugin_plus/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_plus/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_plus/models/ar_node.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin_plus/ar_flutter_plugin.dart';
import 'package:magenta_wifi_vision/views/heatmap_screen.dart';
import 'package:magenta_wifi_vision/widgets/dialog.dart';
import 'package:magenta_wifi_vision/widgets/filled_button.dart';
import 'package:magenta_wifi_vision/widgets/scan_button.dart';
import 'package:magenta_wifi_vision/widgets/text_form_field.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class ScanPRMScreen extends StatefulWidget {
  const ScanPRMScreen({super.key});

  @override
  State<ScanPRMScreen> createState() => _ScanPRMScreenState();
}

class _ScanPRMScreenState extends State<ScanPRMScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ARSessionManager? _arSessionManager;
  ARObjectManager? _arObjectManager;

  @override
  void initState() {
    super.initState();
  }

  /// Configures and initialises the ARView.
  void onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    _arSessionManager = arSessionManager;
    _arObjectManager = arObjectManager;

    _arSessionManager!.onInitialize(
      showFeaturePoints: false,
      showPlanes: false,
      showWorldOrigin: true,
      showAnimatedGuide: true,
      handleTaps: false,
    );
    _arObjectManager!.onInitialize();

    // We place a Mario 3d model at the world origin.
    var marioNode = ARNode(
      type: NodeType.localGLB,
      uri: "assets/mario_obj.glb",
      scale: Vector3(0.02, 0.02, 0.02),
      position: Vector3(0.0, 0.0, 0.0),
      rotation: Vector4(1.0, 0.0, 0.0, 0.0),
    );
    _arObjectManager!.addNode(marioNode);
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
    return Scaffold(
      // Disallowing keyboard to resize scaffold.
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          ARView(onARViewCreated: onARViewCreated),

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
