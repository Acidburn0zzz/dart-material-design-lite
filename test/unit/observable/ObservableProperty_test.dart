@TestOn("chrome")

import 'dart:async';
import 'package:test/test.dart';

// import 'package:logging/logging.dart';
import 'package:mdl/mdlobservable.dart';

//import '../config.dart';

main() async {
    // final Logger _logger = new Logger("test.ObservableProperty");
    
    // configLogging();
    //await saveDefaultCredentials();


    group('ObservableProperty', () {
        setUp(() { });

        test('> set value with setter', () async {
            final ObservableProperty<bool> property = new ObservableProperty<bool>(false);

            expect(property.value, false);

            property.value = "true";
            expect(property.value, true);

            bool valueTester = false;
            property.observes(() => valueTester);

            await new Future.delayed(new Duration(milliseconds: 500),() => true);
            expect(property.value, false);

            valueTester = true;
            await new Future.delayed(new Duration(milliseconds: 500),() => true);
            expect(property.value, true);

        }); // end of 'set value with setter' test

        test('> set value with call operator', () async {
            final ObservableProperty<bool> property = new ObservableProperty<bool>(false);

            expect(property.value, false);

            property.value = "true";
            expect(property.value, true);

            property.value = "false";
            expect(property.value, false);

            property.value = false;
            expect(property.value, false);

            property.value = "1";
            expect(property.value, true);

            property.value = "0";
            expect(property.value, false);

            property.value = "yes";
            expect(property.value, true);

            property.value = "no";
            expect(property.value, false);

        }); // end of 'set value with call operator' test
    });
    // End of 'ObservableProperty' group
}

// - Helper --------------------------------------------------------------------------------------
