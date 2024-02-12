import 'package:flutter/material.dart';
import 'package:task/core/functions/ui/set_system_ui_overlay_style.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        SystemUIAdapter.setOverlayStyle();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
