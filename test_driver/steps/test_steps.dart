import 'package:glob/glob.dart';
import 'package:flutter_driver/flutter_driver.dart' as test;
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';


class UserIsInDashboardStep extends Given {
  @override
  Future<void> executeStep() async {
    print('executing UserIsInDashboardStep..');
    // implement your code
  }

  @override
  RegExp get pattern => RegExp(r"I am on the homepage screen");
}


StepDefinitionGeneric WhenITapTheFloatingActionButtonStep() {
  return when1<String, FlutterWorld>(
    'I tap the floating action button',
      (String input, context) async {
        final locator = test.find.byType("FloatingActionButton");
        await FlutterDriverUtils. tap (context.world.driver,
            locator);
        await FlutterDriverUtils.tap(context.world.driver, locator);
      }
  );
}

StepDefinitionGeneric AndTapThePlusButtonStep() {
  return and<FlutterWorld>(
    'I tap the plus button',
        (context) async {
      // Implement logic to tap the login button
    },
  );
}

/*
StepDefinitionGeneric ThenIShouldSeeTheHomeScreenStep() {
  return then<FlutterWorld>(
    'I should see the home screen',
        (context) async {
      // Implement logic to assert that the home screen is displayed
    },
  );
}

 */
Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/test.feature")]


    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      WhenITapTheFloatingActionButtonStep(),
    ];

  return GherkinRunner().execute(config);
}