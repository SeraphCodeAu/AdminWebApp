import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: MediaQuery.of(context).size.width <= 600 ? AppDrawer() : null, // Drawer for small screens
      body: MediaQuery.of(context).size.width > 600 ? _LargeScreenLayout() : Center(child: Text('Welcome to the Home Page')), // Different layout for large screens
    );
  }
}

class _LargeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Tabs Navigation'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.view_list), text: 'View Complains'),
              Tab(icon: Icon(Icons.people), text: 'View Drivers'),
              Tab(icon: Icon(Icons.search), text: 'Inspection'),
              Tab(icon: Icon(Icons.countertops), text: 'Parcel Count'),
              Tab(icon: Icon(Icons.account_balance), text: 'Invoices'),
              Tab(icon: Icon(Icons.crisis_alert_sharp), text: 'Fines'),
              Tab(icon: Icon(Icons.report_problem_outlined), text: 'Incidents'),
              Tab(icon: Icon(Icons.build), text: 'Toolbox Talk'),
              Tab(icon: Icon(Icons.description), text: 'Contracts'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              // Add more tabs here if needed
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('View Complains')),
            Center(child: Text('View Drivers')),
            Center(child: Text('Inspection')),
            Center(child: Text('Parcel Count')),
            Center(child: Text('Invoices')),
            Center(child: Text('Fines')),
            Center(child: Text('Incidents')),
            Center(child: Text('Toolbox Talk')),
            Center(child: Text('Contracts')),
            Center(child: Text('Settings')),
            // Add more tab views here if needed
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              color: Color(0xffD65454),
            ),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('View Complains'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('View Drivers'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Inspection'),
          ),
          ListTile(
            leading: Icon(Icons.countertops),
            title: Text('Parcel Count'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Invoices'),
          ),
          ListTile(
            leading: Icon(Icons.crisis_alert_sharp),
            title: Text('Fines'),
          ),
          ListTile(
            leading: Icon(Icons.report_problem_outlined),
            title: Text('Incidents'),
          ),
          ListTile(
            leading: Icon(Icons.build),
            title: Text('Toolbox Talk'),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Contracts'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          // Add more ListTiles here if needed
        ],
      ),
    );
  }
}
