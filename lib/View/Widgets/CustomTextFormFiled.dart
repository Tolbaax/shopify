import 'package:flutter/material.dart';
class CustomTextFormFiled extends StatefulWidget {
  bool? secure;
  String? hint;
  IconData? icon;
  bool? eyeView;
  var validator;
  var onSaved;
  TextEditingController? controller;
  CustomTextFormFiled({this.icon,this.hint,this.secure,this.eyeView,this.validator,this.onSaved,this.controller});
  @override
  _CustomTextFormFiledState createState() => _CustomTextFormFiledState();
}
class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(30),

        ),
        child: Column(
          children: [
            TextFormField(
              enableSuggestions: true,
              style: TextStyle(color: Colors.white),
              obscureText: widget.secure!,
              onSaved: widget.onSaved,
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration(
                prefixIcon: Icon(widget.icon,color: Colors.white,size: 19,),
                suffixIcon:
                widget.eyeView!?
                GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        widget.secure= !widget.secure!;
                      });
                    },
                    child: Icon(Icons.visibility_off,color: Colors.white,size: 19,))
                    :null,
                hintText: widget.hint,
                hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
