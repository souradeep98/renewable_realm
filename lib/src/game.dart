// ignore: unnecessary_library_directive
library journey_of_centuries;

import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:journey_of_centuries/src/graphical_components.dart';
import 'package:journey_of_centuries/src/utils.dart';


class JourneyOfCenturies extends FlameGame<JourneyOfCenturiesWorld>
    with
        HasCollisionDetection,
        //HasDraggables,
        ScrollDetector,
        ScaleDetector,
        LogHelperMixin {
  JourneyOfCenturies()
      : super(
          world: Earth(),
          camera: CameraComponent(
            viewfinder: Viewfinder()
              ..anchor = Anchor.topLeft
              ..zoom = 0.1,
          ),
        );

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    //camera.viewfinder.anchor = Anchor.topLeft;
  }

  @override
  void onScroll(PointerScrollInfo info) {
    super.onScroll(info);

    logER(info.scrollDelta.global.y);

    logER(camera.viewfinder.zoom);

    if (info.scrollDelta.global.y < 0) {
      // Zoom in
      camera.viewfinder.zoom += 0.1;
    } else if (info.scrollDelta.global.y > 0) {
      // Zoom out
      if (camera.viewfinder.zoom >= 0.2) {
        camera.viewfinder.zoom -= 0.1;
      }
    }
  }

  late double startZoom;

  @override
  void onScaleStart(ScaleStartInfo info) {
    startZoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    // Take care of zoom
    camera.viewfinder.zoom = startZoom * info.scale.global.y;

    // And drag
    /*logER(info.delta.global);
    const double dragSpeed = 10;
    camera.viewfinder.position -= info.delta.global * (dragSpeed - startZoom);*/
  }
}
