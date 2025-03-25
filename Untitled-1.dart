import 'package:flutter/material.dart';

void main() {
  runApp(GenderEqualityApp());
}

class GenderEqualityApp extends StatelessWidget {
  const GenderEqualityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gender Equality',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GenderEqualityHome(),
    );
  }
}

class GenderEqualityHome extends StatelessWidget {
  const GenderEqualityHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Equality'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: GenderEqualityForm(),
      ),
    );
  }
}

class GenderEqualityForm extends StatefulWidget {
  const GenderEqualityForm({Key? key}) : super(key: key);

  @override
  GenderEqualityFormState createState() => GenderEqualityFormState();
}

class GenderEqualityFormState extends State<GenderEqualityForm> {
  final _controller = TextEditingController();

  void _submitForm() {
    if (_controller.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thank You for Sharing!'),
            content: Text('Your thoughts: "${_controller.text}" have been submitted.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your thoughts!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Your Thoughts',
            border: OutlineInputBorder(),
          ),
          maxLines: 4,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
