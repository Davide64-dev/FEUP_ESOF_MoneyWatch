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

    ..stepDefinitions = [
      Given_I_have_MainButton(),
      When_I_tap_Button(),
      expect_error_message(),
      FillField()
    ]

    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}
