import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_flutter/controllers/CustomerController.dart';
import 'package:pos_flutter/models/CustomerModel.dart';
import 'package:pos_flutter/widgets/my_text.dart';

class CustomerEdit extends StatefulWidget {
  late TextEditingController nameController;
  late String id;

  CustomerEdit(String id) {
    this.id = id;
  }

  @override
  _CustomerEditState createState() => _CustomerEditState();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  FocusNode nodename = FocusNode();
  FocusNode nodeemail = FocusNode();
  FocusNode nodepassword = FocusNode();
  FocusNode nodecontact = FocusNode();
  FocusNode nodeaddress = FocusNode();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isHidden = true;

  String hintText = "Password";
}

class _CustomerEditState extends State<CustomerEdit> {
  void _toggleVisibility() {
    setState(() {
      widget._isHidden = !widget._isHidden;
    });
  }
  late CustomerModel model;

  CustomerController controller = Get.find();

  load() async {

  }

  @override
  Widget build(BuildContext context) {

    return Form(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
          children: [
           Container(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Material(
    borderRadius: BorderRadius.circular(20.0),
    elevation: 6.0,

    ),
    ),
    ),
    Container(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Container(
    width: MediaQuery.of(context).size.width-380,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
    Radius.circular(15)),
    ),
      child: Container(
        decoration: BoxDecoration(
          color: (Colors.grey[300]),
          borderRadius:
          BorderRadius.all(Radius.circular(15)),
        ),
        padding: EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.all(Radius.circular(15)),
          ),
          padding: EdgeInsets.all(15),
          child: Column(
               children: [
                 Text(
                   "Update Customer",
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w700,
                     fontSize: 16.0,
                   ),
                 ),
                 MyText(
                   required: true,
                   placeHolder: "Customer Name ",
                   controller: widget.namecontroller,
                   type: TextInputType.name,
                   nextNode: widget.nodeemail,
                   done: TextInputAction.next,
                 ),
                 MyText(
                   placeHolder: "Customer E-mail ",
                   controller: widget.emailcontroller,
                   expression: "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]",
                   type: TextInputType.emailAddress,
                   nextNode: widget.nodepassword,
                   done: TextInputAction.next,
                 ),
                 Padding(
                   padding: EdgeInsets.all(20),
                   child: TextFormField(
                     maxLength: 25,
                     validator: (String? value) {
                       print('value');
                       if (value==null||value.isEmpty) {
                         return 'Please Enter Password';
                       }
                       return null;
                     },
                     keyboardType: TextInputType.visiblePassword,
                     obscureText: widget.hintText == "Password"
                         ? widget._isHidden
                         : false,
                     controller: widget.passwordcontroller,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       suffixIcon: widget.hintText == "Password"
                           ? IconButton(
                         onPressed: _toggleVisibility,
                         icon: widget._isHidden
                             ? Icon(Icons.visibility_off)
                             : Icon(Icons.visibility),
                       )
                           : null,
                       labelText: 'Password',
                       isDense: true,
                       contentPadding: EdgeInsets.all(12),
                       hintText: 'Enter Password',
                     ),
                     textInputAction: TextInputAction.done,
                   ),
                 ),
                 MyText(
                   placeHolder: "Contact Number ",
                   controller: widget.contactcontroller,
                   type: TextInputType.number,
                   nextNode: widget.nodeaddress,
                   done: TextInputAction.next,
                 ),
                 MyText(
                   placeHolder: "Permanent Address ",
                   controller: widget.addresscontroller,
                   type: TextInputType.streetAddress,
                   lines: 3,
                   nextNode: widget.nodeemail,
                   done: TextInputAction.next,
                 ),
                 FlatButton(
                   color: Color(0xFFFF9858),
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(50)),
                   onPressed: () {
                     controller.add({'name':name})
                     // Get.offNamed(Get.parameters['parent']);
                   },
                   child: Text(
                     "Submit",
                     style: TextStyle(color: Colors.white),
                   ),
                 ),
    ]),
        ),
      ),
    )],
    ),
    ),
    decoration: BoxDecoration(
    color: Theme.of(context).primaryColor.withOpacity(0.06),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    ),
],
      ),
        ),
    );
  }
}
