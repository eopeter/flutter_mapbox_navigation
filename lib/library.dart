library navigation;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

part "flutter_mapbox_navigation.dart";
part "models/wayPoint.dart";
part 'models/routeLeg.dart';
part 'models/routeStep.dart';
part 'models/routeProgressEvent.dart';
part 'models/routeEvent.dart';
part 'models/events.dart';
part 'models/options.dart';
part 'embedded/view.dart';
part 'embedded/controller.dart';

bool _isNullOrZero(dynamic val) {
  return val == 0.0 || val == null;
}
