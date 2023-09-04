import 'package:flutter/material.dart';
import 'package:practice3/animal_Page.dart';
import 'package:practice3/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Cangaroo',
    'Koala',
    'Lion',
    'Tiger'
  ];

   static List<String> animalImagePath = [
    'image/bear.png',
    'image/camel.png',
    'image/deer.png',
    'image/fox.png',
    'image/kangaroo.png',
    'image/koala.png',
    'image/lion.png',
    'image/tiger.png'
  ];

   static List<String> animalLocation = [
    'Forest and Mountain',
    'Dessert',
    'Forest',
    'Snow Mountain',
    'Australia',
    'Australia',
    'Africa',
    'Korea'
  ];

  final List<Animal> animalData = List.generate(animalLocation.length, (index) => 
  Animal(animalName[index], animalLocation[index], animalImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                animalData[index].name
              ),
              leading: SizedBox(
                height: 50,
                width: 50, 
                child: Image.asset(animalData[index].imgPath)
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> AnimalPage(animal: animalData[index],)));
                  debugPrint(animalData[index].name);
                },
            ), 
          );
        },
    ),
    );
  }
}