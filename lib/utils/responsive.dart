import 'package:flutter/material.dart';

/// Responsive utility class for handling different screen sizes
class Responsive {
  final BuildContext context;

  Responsive(this.context);

  /// Get screen width
  double get width => MediaQuery.of(context).size.width;

  /// Get screen height
  double get height => MediaQuery.of(context).size.height;

  /// Get screen orientation
  Orientation get orientation => MediaQuery.of(context).orientation;

  /// Check if device is mobile (width < 600)
  bool get isMobile => width < 600;

  /// Check if device is tablet (600 <= width < 1024)
  bool get isTablet => width >= 600 && width < 1024;

  /// Check if device is desktop (width >= 1024)
  bool get isDesktop => width >= 1024;

  /// Check if device is in landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// Check if device is in portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// Responsive width based on percentage (0.0 - 1.0)
  double wp(double percentage) => width * percentage;

  /// Responsive height based on percentage (0.0 - 1.0)
  double hp(double percentage) => height * percentage;

  /// Responsive font size
  double sp(double size) {
    if (isMobile) return size;
    if (isTablet) return size * 1.2;
    return size * 1.4;
  }

  /// Responsive padding
  EdgeInsets padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    final multiplier = isMobile ? 1.0 : (isTablet ? 1.3 : 1.6);

    if (all != null) {
      return EdgeInsets.all(all * multiplier);
    }

    return EdgeInsets.only(
      left: (left ?? horizontal ?? 0) * multiplier,
      right: (right ?? horizontal ?? 0) * multiplier,
      top: (top ?? vertical ?? 0) * multiplier,
      bottom: (bottom ?? vertical ?? 0) * multiplier,
    );
  }

  /// Responsive margin
  EdgeInsets margin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return padding(
      all: all,
      horizontal: horizontal,
      vertical: vertical,
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );
  }

  /// Responsive icon size
  double iconSize(double baseSize) {
    if (isMobile) return baseSize;
    if (isTablet) return baseSize * 1.3;
    return baseSize * 1.6;
  }

  /// Responsive border radius
  BorderRadius borderRadius(double radius) {
    final multiplier = isMobile ? 1.0 : (isTablet ? 1.2 : 1.4);
    return BorderRadius.circular(radius * multiplier);
  }

  /// Get number of columns for grid based on screen size
  int gridColumns({int mobile = 2, int tablet = 3, int desktop = 4}) {
    if (isMobile) return mobile;
    if (isTablet) return tablet;
    return desktop;
  }

  /// Get responsive value based on screen size
  T value<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  /// Responsive sized box
  SizedBox sizedBox({double? width, double? height}) {
    final multiplier = isMobile ? 1.0 : (isTablet ? 1.3 : 1.6);
    return SizedBox(
      width: width != null ? width * multiplier : null,
      height: height != null ? height * multiplier : null,
    );
  }

  /// Responsive gap for spacing
  double gap(double size) {
    if (isMobile) return size;
    if (isTablet) return size * 1.3;
    return size * 1.6;
  }

  /// Get max width for content (useful for centering on large screens)
  double get maxContentWidth {
    if (isMobile) return width;
    if (isTablet) return 800;
    return 1200;
  }

  /// Responsive card elevation
  double elevation(double baseElevation) {
    if (isMobile) return baseElevation;
    if (isTablet) return baseElevation * 1.2;
    return baseElevation * 1.4;
  }
}

/// Extension on BuildContext for easy access to Responsive
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);

  /// Quick access to common responsive values
  bool get isMobile => Responsive(this).isMobile;
  bool get isTablet => Responsive(this).isTablet;
  bool get isDesktop => Responsive(this).isDesktop;
  bool get isLandscape => Responsive(this).isLandscape;
  bool get isPortrait => Responsive(this).isPortrait;
}

/// Responsive builder widget
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, Responsive responsive) builder;

  const ResponsiveBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context, Responsive(context));
  }
}

/// Responsive layout widget with different layouts for different screen sizes
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    if (responsive.isDesktop && desktop != null) {
      return desktop!;
    }

    if (responsive.isTablet && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
