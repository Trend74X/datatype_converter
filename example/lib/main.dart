import 'package:flutter/material.dart';
import 'package:datatype_converter/datatype_converter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ignore: prefer_typing_uninitialized_variables
  var res;
  String dropdownVal = 'String';
  final textBox = TextEditingController(),
        decimalVal = TextEditingController();
  var dataTypes = ['String', 'int', 'double', 'bool', 'list'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Type Converter'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: textBox,
                decoration: const InputDecoration(
                  labelText: 'Enter any text',
                  hintText: 'Enter any text'
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: dropdownVal,
                    items: dataTypes.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        dropdownVal = newVal!;
                      });
                    }
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () => dataConversion(), 
                    child: const Text('Convert')
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              Visibility(
                visible: dropdownVal == 'double',
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    controller: decimalVal,
                    decoration: const InputDecoration(
                      labelText: 'Enter no. of decimals',
                      hintText: 'Enter no. of decimals'
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Visibility(
                visible: res != null,
                child: Text(
                  'Result: $res',
                  style: const TextStyle(
                    fontSize: 24.0
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dataConversion() {
    //dropdownVal can be passed as null if expected type is string
    // for eg: DataConverter(textBox.text);
    //decimalVal can be passed as null if expected type is other than double
    // for eg: DataConverter(textBox.text, 'int');
    var result = DataConverter(textBox.text, dropdownVal, int.parse(decimalVal.text == "" ? "0" : decimalVal.text));
    setState(() {
      res = result;
    });
  }

}
