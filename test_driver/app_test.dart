import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/test_steps.dart';

Future<void> main() async{
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/feature/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..hooks = []
    ..stepDefinitions = [
      Given_I_have_MainButton(),
      When_I_tap_Button()
    ]
    ..customStepParameterDefinitions = [
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
    //..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}
