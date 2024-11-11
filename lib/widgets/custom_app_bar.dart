import 'package:battery_plus/battery_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../routes/app_routes.dart';  // Ensure this import exists for routing

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({required this.title});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60); // Adjust the height of the AppBar
}

class _CustomAppBarState extends State<CustomAppBar> {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  Battery _battery = Battery();
  int _batteryLevel = 100;
  String _time = '';

  @override
  void initState() {
    super.initState();
    _getConnectivityStatus();
    _getBatteryStatus();
    _getCurrentTime();
    _startClock();
  }

  void _getConnectivityStatus() async {
    var connectivity = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = connectivity;
    });
  }

  void _getBatteryStatus() async {
    var batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  void _getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('hh:mm a');
    setState(() {
      _time = formatter.format(now);
    });
  }

  void _startClock() {
    // This will update the time every minute
    Future.delayed(const Duration(minutes: 1), () {
      _getCurrentTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.splashScreen);  // Navigate to the splash screen
        },
      ),
      title: Text(widget.title),
      actions: [
        // Connectivity Icon
        IconButton(
          icon: Icon(
            _connectivityResult == ConnectivityResult.none
                ? Icons.signal_cellular_off
                : Icons.signal_cellular_4_bar,
            color: _connectivityResult == ConnectivityResult.none
                ? Colors.red
                : Colors.green,
          ),
          onPressed: () {},
        ),
        // Time
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            _time,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        // Battery Icon
        IconButton(
          icon: Icon(
            _batteryLevel < 20 ? Icons.battery_alert : Icons.battery_full,
            color: _batteryLevel < 20 ? Colors.red : Colors.green,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
