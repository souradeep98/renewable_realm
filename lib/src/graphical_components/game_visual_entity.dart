part of '../graphical_components.dart';

abstract class GameVisualEntity extends PositionComponent
    implements GameEntity {
  List<PositionComponent> getComponents();
}
