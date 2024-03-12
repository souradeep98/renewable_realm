library mechanical_components;

import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/foundation.dart';

part 'mechanical_components/base_classes/game_entity.dart';

part 'mechanical_components/base_classes/game_duration.dart';
part 'mechanical_components/base_classes/json_convertible.dart';
part 'mechanical_components/base_classes/rate.dart';
part 'mechanical_components/base_classes/ratio.dart';
part 'mechanical_components/base_classes/range.dart';
part 'mechanical_components/base_classes/item.dart';
part 'mechanical_components/base_classes/dependable.dart';
part 'mechanical_components/base_classes/dependent.dart';
part 'mechanical_components/base_classes/buildable.dart';
part 'mechanical_components/base_classes/upgradable.dart';
part 'mechanical_components/base_classes/service.dart';
part 'mechanical_components/base_classes/global_storage.dart';
part 'mechanical_components/base_classes/periodic_executable.dart';
part 'mechanical_components/base_classes/probability_rate.dart';

part 'mechanical_components/base_classes/influenceable.dart';

part 'mechanical_components/services/power_plant.dart';
part 'mechanical_components/services/power_plants/coal_based_power_plant.dart';

part 'mechanical_components/services/school.dart';
part 'mechanical_components/services/university.dart';
part 'mechanical_components/services/research_centre.dart';

part 'mechanical_components/city.dart';
part 'mechanical_components/house.dart';
part 'mechanical_components/upgrades.dart';
part 'mechanical_components/world_event_logs.dart';

part 'mechanical_components/city_components/disease_system/disease.dart';

part 'mechanical_components/influence_system.dart';
