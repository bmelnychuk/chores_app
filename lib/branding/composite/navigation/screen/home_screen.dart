import 'package:chores_app/branding/composite/navigation/navigation.dart';
import 'package:chores_app/branding/composite/widget/chores_list.dart';
import 'package:chores_app/branding/composite/widget/family_members_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabs = [
    ChoresList(),
    FamilyMembersGrid(),
  ];

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check), title: new Text('Chores')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: new Text('Family')),
        ],
      ),
      appBar: AppBar(title: Text('Chores')),
      floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            context.read<Navigation>().goToChoreForm(Uuid().v4());
          }),
      body: tabs[selectedTab],
    );
  }
}
