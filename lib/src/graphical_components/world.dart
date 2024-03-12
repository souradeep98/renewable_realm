part of '../graphical_components.dart';

abstract class JourneyOfCenturiesWorld extends World
    with DragCallbacks, HasGameRef<JourneyOfCenturies>, LogHelperMixin {
  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    logER(event);
    logER("Current camera position: ${gameRef.camera.viewfinder.position}");
    final Vector2 allowedMaxCameraPosition = Vector2(32 * 300, 32 * 500);
    logER("Allowed max camera position: $allowedMaxCameraPosition");
    final Vector2 resultVector =
        (gameRef.camera.viewfinder.position - event.localDelta)
          ..clamp(
            Vector2.all(0),
            Vector2.all(1000),
          );
    logER("New camera position: $resultVector");
    gameRef.camera.viewfinder.position = resultVector;
  }
}

final class Earth extends JourneyOfCenturiesWorld {
  @override
  Future<void> onLoad() async {
    final Sprite islandSprite = await Sprite.load("map.png");

    final SpriteComponent island = SpriteComponent(
      sprite: islandSprite,
    );

    add(island);

    gameRef.camera.setBounds(
      Rectangle.fromPoints(
        Vector2.all(0),
        islandSprite.originalSize,
      ),
    );

    // Add city

    await super.onLoad();
  }
}
