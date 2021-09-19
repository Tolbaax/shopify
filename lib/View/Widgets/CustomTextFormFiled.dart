import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextFormFiled extends StatefulWidget {
  String? name;
  bool? secure;
  String? hint;
  IconData? icon;
  bool? eyeView;
  CustomTextFormFiled({this.icon,this.hint,this.secure,this.name,this.eyeView});

  @override
  _CustomTextFormFiledState createState() => _CustomTextFormFiledState();
}
class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.name!,style:
            GoogleFonts.share(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.black),),
          ),

          TextFormField(
            obscureText: widget.secure!,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon,color: Colors.deepPurpleAccent,),
              suffixIcon:
              widget.eyeView!?
              GestureDetector(
                  onTap: ()
                  {
                    setState(() {
                      widget.secure= !widget.secure!;
                    });
                  },
                  child: Icon(Icons.visibility_off,color: Colors.deepPurpleAccent,))
                  :null
              ,
              hintText: widget.hint,
            ),
          ),
        ],
      ),
    );
  }
}
