import 'package:flutter/material.dart';

class ShowStudents extends StatelessWidget{
   ShowStudents({super.key,required this.studentsInfo});
List studentsInfo;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Students List"),),
     body: ListView.builder(
       itemCount: studentsInfo.length,
      itemBuilder:
          (context,i)=>
                Center(child: ListTile(title: Text(studentsInfo[i]),),),),
   );
  }

}