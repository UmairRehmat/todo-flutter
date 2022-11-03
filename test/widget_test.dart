// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testtodo/dependency_container.dart';
import 'package:testtodo/features/add_task/presentation/pages/task_page.dart';

var pressed = false;

void main() async {
  await init();
  testWidgets('task screen is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: TaskScreen(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('task screen contains tasks', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: TaskScreen(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.text('Tasks'), findsOneWidget);
  });

  testWidgets('task screen contains listview widget',
      (WidgetTester tester) async {
    // the items to add to list
    List<String> listItems = ["item 1", "item 2", "item 3"];

    final testWidget = MaterialApp(
      home: TaskScreen(),
    );

    //start the widget
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    // final ListViewBuilder = find.descendant(
    //   of: find.byKey(Key("myListView")),
    //   matching: find.byType(Material),
    // );

    expect(find.byKey(Key('myListView')), findsOneWidget);

    // //find all text widgets
    // List<Widget> asd = tester.widgetList(find.byType(Text)).toList();
    // int n = 0;

    // //verify
    // asd.forEach((element) {
    //   expect(element.toString().contains(listItems[n]), true,
    //       reason: "Not found");
    //   debugPrint(listItems[n] + " found");
    //   n += 1;
    // });
  });

  testWidgets('task screen have button', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: TaskScreen(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byKey(Key('add_button')), findsOneWidget);
  });

  testWidgets('notify when button is pressed', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: TaskScreen(
        onPressed: () => pressed = true,
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(pressed, isTrue);
  });

  testWidgets('Simple dialog control test', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: TaskScreen(
        onPressed: () => pressed = true,
      ),
    );
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.element(find.byIcon(Icons.add));
    final Future result = showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Title'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 42);
              },
              child: const Text('First option'),
            ),
            const SimpleDialogOption(
              child: Text('Second option'),
            ),
          ],
        );
      },
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('Title'), findsOneWidget);
    await tester.tap(find.text('First option'));
    expect(await result, equals(42));
  });
}
