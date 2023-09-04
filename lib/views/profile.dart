import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
      )),
    );
  }
}

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "Ahmed Nabil";
  String email = 'AhmedNabil@outlook.com';
  String favoriteCuisine = 'Italian';
  //List<String> allergies = ['None'];
  int totalOrders = 15;
  String lastOrder = 'Spaghetti Carbonara';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: <Widget>[
              // Profile Picture and User Information
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/Group.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      username,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(email),
                  ],
                ),
              ),

              // Food Preferences
              ListTile(
                title: Text(
                  'Food Preferences',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'Favorite Cuisine: $favoriteCuisine',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),

              // Order History
              ListTile(
                title: Text(
                  'Order History',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'Total Orders: $totalOrders',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              ListTile(
                title: Text(
                  'Last Order: $lastOrder',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),

              // User Reviews
              ListTile(
                title: Text(
                  'User Reviews',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListTile(
                title: Text(
                  'Restaurant XYZ - Excellent food!',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
              ListTile(
                title: Text(
                  'Restaurant ABC - Great service!',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),

              // Edit Profile Button
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
                onTap: () {
                  // Navigate to the edit profile screen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ));
                },
              ),

              // Logout Button
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  // Perform logout action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      // Add form fields for editing profile information here
    );
  }
}
