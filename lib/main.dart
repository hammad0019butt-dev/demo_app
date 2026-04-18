// ignore_for_file: prefer_const_constructors_in_immutables, constant_identifier_names

import 'package:demo_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  static const String KEYVALUE_STRING = 'name';
  static const String KEYVALUE_INTEGER = 'number';

  var textValue = 'No text saved';
  var numberValue = 'No number saved';

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getText = prefs.getString(KEYVALUE_STRING);
    var getNumber = prefs.getInt(KEYVALUE_INTEGER);

    textValue = getText.toString();
    numberValue = getNumber.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 34),

            // Title
            Text(
              'Shared Preference',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),

            SizedBox(height: 24),

            // Text Field 1
            HTextField(
              controller: textController,
              labelText: 'Enter Text',
              hintText: 'Name, Place, intro, etc.',
            ),

            SizedBox(height: 16),

            // Text Field 2
            HTextField(
              controller: numberController,
              labelText: 'Enter Number',
              hintText: 'Phone, Age, etc.',
              keyBoardType: TextInputType.numberWithOptions(),
            ),

            SizedBox(height: 16),

            // Button
            SizedBox(
              width: 260,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString(
                    KEYVALUE_STRING,
                    textController.text.toString(),
                  );
                  prefs.setString(
                    KEYVALUE_INTEGER,
                    numberController.text.toString(),
                  );

                  setState(() {});
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            SizedBox(height: 24),

            // Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // List TIle
                ListTile(
                  title: Text(
                    textValue,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    numberValue,
                    style: TextStyle(
                      color: const Color(0xFF1C1C1C),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
