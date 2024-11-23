import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetMethodChannel extends StatefulWidget {
  const GetMethodChannel({super.key});

  @override
  State<GetMethodChannel> createState() => _GetMethodChannelState();
}

class _GetMethodChannelState extends State<GetMethodChannel> {
  static const MethodChannel _methodChannel = MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
String _batteryLevel = 'Unknown battery level.';

Future<void> _getBatteryLevel() async {
  String batteryLevel;
  try {
    final result = await _methodChannel.invokeMethod<int>('getBatteryLevel');
    batteryLevel = 'Battery level at $result % .';
  } on PlatformException catch (e) {
    batteryLevel = "Failed to get battery level: '${e.message}'.";
  }

  setState(() {
    _batteryLevel = batteryLevel;
  });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}