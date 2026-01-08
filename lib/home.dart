import 'package:flutter/material.dart';
import 'add_student.dart';
import 'home_page.dart';
Color c = Colors.red;

class Homee extends StatelessWidget {
  const Homee({super.key});

  buildListTile(context,txt,icon,page){

    return ListTile(title: Text(txt),
      tileColor:Colors.white,
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>page,));

      },
      leading: Icon(icon),trailing: Icon(Icons.arrow_forward_ios,color: Colors.red,),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("الرئيسي"),backgroundColor: Colors.white,centerTitle: true,),


          drawer:Drawer(
          child: ListView(
            children: [
              DrawerHeader(decoration: BoxDecoration(color: Colors.black45),

                  child: Column(
                    spacing: 11,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/h.jpg"),
                          radius: 50,),
                      ),
                      Expanded(child: Text("الخصائص", style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),)
                      )
                    ],
                  )),
              buildListTile(context, "الرئيسي", Icons.home,Homee()),
              buildListTile(context, "اضافة طالب", Icons.category,AddStudent()),
              buildListTile(context, "العروض", Icons.local_offer,Homee() ),
              buildListTile(context, "عروض الصور", Icons.image_rounded ,HomePage(), ),
            ],
          ),

          width: MediaQuery.of(context).size.width/2,
        ),

        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            backgroundColor: Colors.black,
              items: [
                BottomNavigationBarItem(

                    icon: IconButton(onPressed: ()=> print("Ook"),icon:Icon(Icons.home,color:Colors.black,)), label:"الرئيسي"),

                BottomNavigationBarItem(icon: IconButton(onPressed: ()=> print("Ook"),icon:Icon(Icons.category,color:Colors.black,)), label:"الفئات"),

                BottomNavigationBarItem(icon: IconButton(onPressed: ()=> print("Ook"),icon:Icon(Icons.local_offer,color:Colors.black,)), label:"العروض"),
                BottomNavigationBarItem(icon: IconButton(onPressed: ()=> print("Ook"),icon:Icon(Icons.shopping_cart_outlined,color:Colors.black,)), label:"السلة"),
                BottomNavigationBarItem(icon: IconButton(onPressed: ()=> print("Ook"),icon:Icon(Icons.perm_identity_rounded,color:Colors.black,)), label:"حسابي"),


              ])
      );
  }

}



