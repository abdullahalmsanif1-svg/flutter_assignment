import 'package:flutter/material.dart';
import 'show_students.dart';

class AddStudent extends StatefulWidget {
  AddStudent({super.key});

  @override
  State createState() => _AddStudentState();
}

class _AddStudentState extends State{
  List students=["Essam","Abdullah","Abdulrahman"];
 Color c=Colors.amber[100]!;
  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Add Student"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
          padding: const EdgeInsets.all(7.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(33),
                      borderSide:BorderSide(color: Colors.red,style: BorderStyle.solid,
                        width: 5
                      )
                  ),
                filled: true,
                  labelText: "Name",
                  hintText: "input u name:",
                  fillColor: c,
                  prefixIcon: Icon(Icons.person),

              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:WidgetStatePropertyAll( c )
                  ),
                  onPressed: () {
                    setState(() {

                    });
                    if(name.text.isNotEmpty&&!students.contains(name.text)&&name.text!="")
                    {
                      students.add(name.text);
                      name.clear();

                    }
                    else
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ادخل قيمة صحيحة")));
                  }, child:Text("Add Student")),
                    ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll( c )
                    ),
                    onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowStudents(studentsInfo: students),
    ),
    );
    },
    child: Text("عرض الطلاب"),
                    ),
            ],
          ),
            Expanded(child:   ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, i) =>
                Card(child: ListTile(
              leading: IconButton(onPressed:(){
                showDialog(
                    context: context,
                    builder: (context)=>AlertDialog(
                      content: Text("هل تريد الحذف النهائي؟"),
                      actions: [
                        TextButton(
                            onPressed: (){
                              students.removeAt(i);
                              setState(() {});
                              Navigator.pop(context);
                            },
                        child: Text("Yes"),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          child: Text("No"),
                            )
                      ],
                    ),
                );
              },

                  icon: Icon(Icons.delete_forever,color: Colors.red,),
              ),
                trailing: IconButton(onPressed:(){
                  setState(() {});
                  students[i]=name.text;
                  },
                  icon: Icon(Icons.edit,color: Colors.blue,),
                  ),
                  onTap: (){
                name.text= students[i];
                  },
                  title: Text(students[i],
                  textAlign:  TextAlign.center,),
                  tileColor: c,
              ),),
            )
            )

        ],
      ),
    );
  }
}
