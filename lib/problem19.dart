import 'package:flutter/material.dart';

void main() {
  runApp(const MyDrawerApp());
}

class MyDrawerApp extends StatelessWidget {
  const MyDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Side Drawer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _drawerOpen = false;

  void toggleDrawer() {
    setState(() {
      _drawerOpen = !_drawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _drawerOpen ? 250 : 0,
            top: 0,
            right: _drawerOpen ? -250 : 0,
            bottom: 0,
            child: Material(
              elevation: _drawerOpen ? 8 : 0,
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    title: const Text("Home"),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: toggleDrawer,
                    ),
                  ),
                  const Center(
                    child: Text("Main Content",
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _drawerOpen ? 0 : -250,
            top: 0,
            bottom: 0,
            child: SizedBox(
              width: 250,
              child: Drawer(
                child: Column(
                  children: [
                    const UserAccountsDrawerHeader(
                      accountName: Text("Sourov"),
                      accountEmail: Text("sourov@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text("Home"),
                      onTap: toggleDrawer,
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      onTap: toggleDrawer,
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text("Logout"),
                      onTap: toggleDrawer,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
