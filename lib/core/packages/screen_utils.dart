import 'package:flutter/material.dart';

class ScreenUtils {
  static bool? _isPortrait;
  static bool? _isLandscape;
  static bool? _isTablet;

  static bool get isPortrait {
    if (_isPortrait == null) {
      throw Exception(
        "You not init ScreenUtils\nYou must be warp root widget ScreenUtilsInit",
      );
    }
    return _isPortrait!;
  }

  static bool get isLandscape {
    if (_isLandscape == null) {
      throw Exception(
        "You not init ScreenUtils\nYou must be warp root widget ScreenUtilsInit",
      );
    }
    return _isLandscape!;
  }

  static bool get isTablet {
    if (_isTablet == null) {
      throw Exception(
        "You not init ScreenUtils\nYou must be warp root widget ScreenUtilsInit",
      );
    }

    return _isTablet!;
  }

  static void init({
    required bool isPortrait,
    required bool isLandscape,
    required bool isTablet,
  }) {
    _isPortrait = isPortrait;
    _isLandscape = isLandscape;
    _isTablet = isTablet;
  }
}

typedef RebuildFactor = bool Function(MediaQueryData old, MediaQueryData data);
typedef ScreenUtilInitsBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

class RebuildFactors {
  const RebuildFactors._();

  static bool size(MediaQueryData old, MediaQueryData data) {
    return old.size != data.size;
  }

  static bool orientation(MediaQueryData old, MediaQueryData data) {
    return old.orientation != data.orientation;
  }

  static bool sizeAndViewInsets(MediaQueryData old, MediaQueryData data) {
    return old.viewInsets != data.viewInsets;
  }

  static bool all(MediaQueryData old, MediaQueryData data) {
    return old != data;
  }
}

class ScreenUtilsInit extends StatefulWidget {
  final RebuildFactor rebuildFactor;
  final ScreenUtilInitsBuilder builder;
  final Widget? child;

  const ScreenUtilsInit({
    super.key,
    required this.builder,
    this.child,
    this.rebuildFactor = RebuildFactors.size,
  });

  @override
  State<ScreenUtilsInit> createState() => _ScreenUtilsInitState();
}

class _ScreenUtilsInitState extends State<ScreenUtilsInit>
    with WidgetsBindingObserver {
  MediaQueryData? _mediaQueryData;

  bool wrappedInMediaQuery = false;

  WidgetsBinding get binding => WidgetsFlutterBinding.ensureInitialized();

  MediaQueryData get mediaQueryData => _mediaQueryData!;

  MediaQueryData get newData => MediaQueryData.fromView(View.of(context));

  _updateTree(Element el) {
    el.markNeedsBuild();
    el.visitChildren(_updateTree);
  }

  @override
  void initState() {
    super.initState();
    // mediaQueryData = newData;
    binding.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final old = _mediaQueryData!;
    final data = newData;

    if (widget.rebuildFactor(old, data)) {
      _mediaQueryData = data;
      _updateTree(context as Element);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mediaQueryData ??= newData;
    didChangeMetrics();
  }

  @override
  void dispose() {
    binding.removeObserver(this);
    super.dispose();
  }

  Widget get child => widget.builder.call(context, widget.child);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
