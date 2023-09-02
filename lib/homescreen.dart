import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//Set=> Add Shared Pref Database || Key, Value || "Name":NameController
//Get=> To Get All The Data From The Database || Key || "Name"

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getName();
  }
  TextEditingController NameController = TextEditingController();
  String? name;

  void getName()async{
    var prefs=await SharedPreferences.getInstance();
    name=prefs.getString("Name");
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextField(
              controller: NameController,
              decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  suffixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24))),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: ()async{
            var prefs=await SharedPreferences.getInstance();
            prefs.setString("Name", NameController.text.toString());
          }, child: Text("Save")),
          SizedBox(height: 30),
          Text("${name??"First Time"}")
        ],
      ),
    );
  }
}
