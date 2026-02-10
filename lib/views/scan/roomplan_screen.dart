import 'package:flutter/material.dart';
import 'package:magenta_wifi_vision/widgets/magenta_app_bar.dart';
import 'package:roomplan_flutter/api/exceptions.dart';
import 'package:roomplan_flutter/api/room_plan_scanner.dart';

class ScanRoomplanScreen extends StatefulWidget {
  const ScanRoomplanScreen({super.key});

  @override
  State<ScanRoomplanScreen> createState() => _ScanRoomplanScreenState();
}

class _ScanRoomplanScreenState extends State<ScanRoomplanScreen> {
  final _roomScanner = RoomPlanScanner();
  int? numberOfWalls;
  bool _isScanning = false;

  Future<void> _startScan() async {
    setState(() => _isScanning = true);

    try {
      final result = await _roomScanner.startScanning();
      print(result);
      if (result != null) {
        numberOfWalls = result.room.walls.length;
      } else {
        Navigator.of(context).pop();
      }
    } on RoomPlanPermissionsException {
      print('Camera permission denied. Please grant camera access.');
    } on ScanCancelledException {
      print('Scan was cancelled by the user.');
    } catch (e) {
      print('Error during scan: $e');
      Navigator.of(context).pop();
    } finally {
      setState(() => _isScanning = false);
    }

    _stopScan();
  }

  Future<void> _stopScan() async {
    await _roomScanner.stopScanning();
    setState(() => _isScanning = false);
  }

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  @override
  void dispose() {
    _roomScanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isScanning ? MagentaAppBar(title: Text("Roomplan Test")) : null,
      body: _isScanning ? SizedBox.shrink()
          : Center(
        child: Text("$numberOfWalls"),
      )
    );
  }
}
