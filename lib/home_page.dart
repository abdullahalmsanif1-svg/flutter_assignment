import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'image_picker_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Column(
        children: [

          CarouselSlider(
            options: CarouselOptions(
              height: 220,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: [
              'https://picsum.photos/400/200?1',
              'https://picsum.photos/400/200?2',
              'https://picsum.photos/400/200?3',
            ].map((imageUrl) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),),);

            }).toList(),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePickerPage()));
            }, child: Text("Enter")),
          )
        ],
      ),
    );
  }
}
