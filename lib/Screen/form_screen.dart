import 'package:customeraccount/Service/postvalue.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String? user_type = "Customer";
  bool sign_up_status = true;
  String? _name;
  String? _email;
  String? _password;
  String? _mobile_no;
  String? map_location = "Delhi";
  String? latitude = "21.2536521";
  String? longitude = "79.36255222";
  String? _address;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _password = value;
      },
    );
  }

  Widget _buildmobile_no() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _mobile_no = value;
      },
    );
  }

  Widget _buildaddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }

        return null;
      },
      onSaved: (String? value) {
        _address = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Customer Account")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildPassword(),
                _buildmobile_no(),
                _buildaddress(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      debugPrint("Save button clicked");
                      _save();
                    });

                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();

                    // print(_name);
                    // print(_email);
                    // print(_mobile_no);
                    // print(_password);
                    // print(_address);
                    // print(map_location);
                    // print(longitude);
                    // print(latitude);

                    // //Send to API
                    // postvalue(_name, _email, _password, _mobile_no, _address);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _save() async {
    //moveToLastScreen();

    //int result;
    // if (pet.id != null) {
    //   result = await helper.updateNote(note);
    //   print("update $result");
    // } else {
    //   result = await helper.insertNote(note);
    //print(result);
    //}

    if (Response != 0) {
      _showAlertDialog('Status', 'Contact Saved Successfully');
    } else {
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message), //
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
