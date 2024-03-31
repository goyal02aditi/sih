import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'signup.dart';
import 'info.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SignUpPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 70),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Dashboard', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                  
                  trailing: Icon(CupertinoIcons.bell, color: Colors.white,size:30),
                ),
                
              ],
            ),
          ),
          
          Container(
            
            child: Container(
                            
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                childAspectRatio: 4/2,
               
                children: [
                  
                  Container(
      margin: EdgeInsets.all(8), // Adjust the margin as per your preference
      child: itemDashboard('Hospitals Nearby', CupertinoIcons.building_2_fill, Colors.teal),
    ),
    Container(
      margin: EdgeInsets.all(8), // Adjust the margin as per your preference
      child: itemDashboard('Blood Banks Nearby', CupertinoIcons.drop_fill, Colors.red),
    ),
    Container(
      margin: EdgeInsets.all(8), // Adjust the margin as per your preference
      child: itemDashboard('Request by Others', CupertinoIcons.person_2, Colors.purple),
    ),
    Container(
      margin: EdgeInsets.all(8), // Adjust the margin as per your preference
      child: itemDashboard('Display Metadata', CupertinoIcons.checkmark_circle_fill, Colors.green),
    ),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    
    bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

    );
  }

  itemDashboard(String title, IconData iconData, Color background) => GestureDetector( onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoPage()),);},
  
  
    child: Container(
      height: MediaQuery.of(context).size.width * 0.2, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5
          )
        ]
      ),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white)
            ),
          
          const SizedBox(width: 15),
          Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
        SizedBox(width: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
         child: Text(
            'View More',
            style: TextStyle(color: Colors.white),
          ),
      ),],
      ),
    ),
  );
}
