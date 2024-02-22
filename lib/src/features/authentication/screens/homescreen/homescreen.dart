import 'package:flutter/material.dart';
import 'package:verificationapp/src/constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> messagetypelist = [
    {'title': 'Rebecca'},
    {'title': 'Grace'},
    {'title': 'Claire'},
    {'title': 'Harvey'},
    {'title': 'Mike'},
    {'title': 'Ross'},
    {'title': 'Jessica'},
    {'title': 'Rachel'},
    {'title': 'Jenny'},
    {'title': 'Antony'},
    {'title': 'Stella'},
    {'title': 'Felome'},
    {'title': 'Karen'},
    {'title': 'Georgia'},
    {'title': 'Ginny'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: ambercolor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
               height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: messagetypelist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    
                      leading: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: ambercolor),
                      ),
                      title: Text(messagetypelist[index]['title']));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
