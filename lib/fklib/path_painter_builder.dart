import 'package:flutter/material.dart';
import 'debug.dart';
import 'line_animation.dart';
import 'painter.dart';
import 'parser.dart';

class PathPainterBuilder {
  List<Paint> paints;
  void Function(int currentPaintedPathIndex) onFinishFrame;
  bool scaleToViewport;
  DebugOptions debugOptions;
  List<PathSegment> pathSegments;
  bool isUnderlay;
  LineAnimation lineAnimation;
  Animation<double> animation;
  Size customDimensions;

  PathPainterBuilder([LineAnimation lineAnimation, bool isUnderlay]) {
    this.lineAnimation = lineAnimation;
    this.isUnderlay = isUnderlay;
  }

  PathPainter build() {
    if (isUnderlay != null && isUnderlay == true) {
      return PaintedPainter(animation, pathSegments, customDimensions, paints,
          onFinishFrame, scaleToViewport, debugOptions);
    }
    switch (lineAnimation) {
      case LineAnimation.oneByOne:
        return OneByOnePainter(animation, pathSegments, customDimensions,
            paints, onFinishFrame, scaleToViewport, debugOptions);
      case LineAnimation.allAtOnce:
        return AllAtOncePainter(animation, pathSegments, customDimensions,
            paints, onFinishFrame, scaleToViewport, debugOptions);
      default:
        return null;
    }
  }

  void setAnimation(Animation<double> animation) {
    this.animation = animation;
  }

  void setIsUnderlay(bool isUnderlay) {
    this.isUnderlay = isUnderlay;
  }

  void setCustomDimensions(Size customDimensions) {
    this.customDimensions = customDimensions;
  }

  void setPaints(List<Paint> paints) {
    this.paints = paints;
  }

  void setOnFinishFrame(
      void Function(int currentPaintedPathIndex) onFinishFrame) {
    this.onFinishFrame = onFinishFrame;
  }

  void setScaleToViewport(bool sc) {
    this.scaleToViewport = sc;
  }

  void setDebugOptions(DebugOptions debug) {
    this.debugOptions = debug;
  }

  void setPathSegments(List<PathSegment> pathSegments) {
    this.pathSegments = pathSegments;
  }
}
