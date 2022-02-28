import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Form Exp 4';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.deepPurple,
          title: const Text('Form Validation'),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  int valuef = 1;
  int valuem = 2;
  int val1 = -1;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    var _ratingController;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
               icon: Icon(Icons.person),
              hintText: 'Enter your Name',
              labelText: 'Name',
         
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kindly enter your Name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Enter a Phone Number',
              labelText: 'Phone',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 10) {
                return 'Kindly enter your Phone Number';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter your Date Of Birth',
              labelText: 'Dob',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kindly enter your Date of Birth';
              }
              return null;
            },
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: Icon(Icons.book),
            ),
            value: _ratingController,
            onSaved: (value) {
              setState(() {
                _ratingController = value;
              });
            },
            items: [
              'Computer Science',
              'Information Technology',
              'Mechanical',
              'EXTC',
              'PPT'
            ]
                .map((label) => DropdownMenuItem(
                      child: Text(label.toString()),
                      value: label,
                    ))
                .toList(),
            hint: const Text('Select Your Branch'),
            onChanged: (value) {
              setState(() {
                _ratingController = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Kindly choose Your Branch';
              }
              return null;
            },
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              children: const <Widget>[
                Text(
                  'Kindly Select Your Gender',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          )),
          Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: 1,
                    groupValue: val1,
                    onChanged: (value) {
                      setState(() {
                        val1 = valuef;
                      });
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: 2,
                    groupValue: val1,
                    onChanged: (value) {
                      setState(() {
                        val1 = valuem;
                      });
                    },
                    activeColor: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (val1 < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kindly Select Your Gender')),
                  );
                } else if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sucessfully Submitted')),
                  );
                }
              }
            },

            style: ButtonStyle(
               backgroundColor:MaterialStateProperty.all<Color>( Colors.deepPurple)
               ),
            child: const Text('Submit'),
            
          )
        ],
      ),
    );
  }
}
