import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../screens/events_screen.dart';
import '../screens/job_screen.dart';
import '../screens/login_screen.dart';
import '../screens/messaging_screen.dart';
import '../screens/social_instagram_screen.dart';

class DashboardScreen extends StatefulWidget {
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [_buildHomePage(), _buildEventsPage(), _buildDirectoryPage(), _buildProfilePage()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Able Mates'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No new notifications')));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.name),
              accountEmail: Text(widget.user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  widget.user.name[0].toUpperCase(),
                  style: TextStyle(fontSize: 40.0, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Settings page - Coming soon')));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _logout();
              },
            ),
          ],
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Directory'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome card with gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.waving_hand, color: Colors.amber, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'Welcome back!',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.user.name,
                            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.verified_user, color: Colors.white, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  widget.user.userType,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(Icons.star, color: Colors.amber[300], size: 40),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Main Features Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: [
                _buildFeatureCard(
                  number: '1',
                  icon: Icons.photo_camera,
                  title: 'Social/Insta',
                  color: Colors.pink,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SocialInstagramScreen()));
                  },
                ),
                _buildFeatureCard(
                  number: '2',
                  icon: Icons.message,
                  title: 'Messaging',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MessagingScreen()));
                  },
                ),
                _buildFeatureCard(
                  number: '3',
                  icon: Icons.event,
                  title: 'Able Events',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EventsScreen()));
                  },
                ),
                _buildFeatureCard(
                  number: '4',
                  icon: Icons.sports_esports,
                  title: 'Games',
                  color: Colors.purple,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Games - Coming soon')));
                  },
                ),
                _buildFeatureCard(
                  number: '5',
                  icon: Icons.pages,
                  title: 'Able Pages',
                  color: Colors.teal,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
                _buildFeatureCard(
                  number: '6',
                  icon: Icons.work,
                  title: 'Job Search',
                  color: Colors.green,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JobScreen()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick Stats Section
            Row(
              children: [
                const Icon(Icons.timeline, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Quick Stats',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.event_available,
                    label: 'Events',
                    value: '12',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(icon: Icons.people, label: 'Connections', value: '48', color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(icon: Icons.message, label: 'Messages', value: '5', color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent activity
            Row(
              children: [
                const Icon(Icons.history, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Recent Activity',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildActivityCard(
              'Welcome to Able Mates!',
              'Get started by exploring events and connecting with others.',
              Icons.celebration,
              Colors.purple,
            ),
            const SizedBox(height: 12),
            _buildActivityCard(
              'New Event Available',
              'Check out "Yoga & Meditation by the Harbour" happening this Sunday.',
              Icons.local_activity,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.event, color: Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Upcoming Events',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EventsScreen()));
                },
                icon: const Icon(Icons.explore, size: 18),
                label: const Text('Explore All'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildEventCard(
                  'Community Coffee Meetup',
                  'Join us for a casual coffee and conversation',
                  'Tomorrow, 10:00 AM',
                  Icons.coffee,
                  Colors.brown,
                ),
                _buildEventCard(
                  'Basketball Game',
                  'Friendly basketball match at the local court',
                  'Friday, 3:00 PM',
                  Icons.sports_basketball,
                  Colors.deepOrange,
                ),
                _buildEventCard(
                  'Art Workshop',
                  'Learn painting techniques with local artists',
                  'Saturday, 2:00 PM',
                  Icons.palette,
                  Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectoryPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.business, color: Colors.teal),
              ),
              const SizedBox(width: 12),
              Text(
                'Service Directory',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('Find services and support near you', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _buildDirectoryCard(
                  'Allied Health Services',
                  'Professional health and therapy services',
                  Icons.local_hospital,
                  Colors.red,
                ),
                _buildDirectoryCard(
                  'Support Workers',
                  'Find qualified support workers in your area',
                  Icons.people,
                  Colors.blue,
                ),
                _buildDirectoryCard(
                  'Recreation Activities',
                  'Discover local activities and programs',
                  Icons.sports_esports,
                  Colors.purple,
                ),
                _buildDirectoryCard(
                  'Service Providers',
                  'Browse registered service providers',
                  Icons.business_center,
                  Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Avatar with border
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 52,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    widget.user.name[0].toUpperCase(),
                    style: const TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.user.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(widget.user.email, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified_user, size: 18, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 6),
                  Text(
                    widget.user.userType,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(Icons.edit, 'Edit Profile'),
            _buildProfileOption(Icons.security, 'Privacy & Security'),
            _buildProfileOption(Icons.notifications, 'Notifications'),
            _buildProfileOption(Icons.help, 'Help & Support'),
            _buildProfileOption(Icons.info, 'About'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required String number,
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.15), color.withOpacity(0.05)],
        ),
        boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 12, offset: const Offset(0, 6))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Number badge with enhanced design
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [color, color.withOpacity(0.7)],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: color.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 3)),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            number,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Icon with circular background
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: color.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))],
                  ),
                  child: Icon(icon, size: 35, color: color),
                ),
                const SizedBox(height: 5),
                // Title with better styling
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({required IconData icon, required String label, required String value, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(String title, String description, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
      ),
    );
  }

  Widget _buildEventCard(String title, String description, String time, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: color.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          // Decorative colored bar
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 14, color: color),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[300]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectoryCard(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [BoxShadow(color: color.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title - Coming soon')));
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color.withOpacity(0.8), color],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(Icons.arrow_forward, size: 18, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    final Color iconColor;
    final Color bgColor;

    // Assign colors based on option type
    switch (title) {
      case 'Edit Profile':
        iconColor = Colors.blue;
        bgColor = Colors.blue;
        break;
      case 'Privacy & Security':
        iconColor = Colors.green;
        bgColor = Colors.green;
        break;
      case 'Notifications':
        iconColor = Colors.orange;
        bgColor = Colors.orange;
        break;
      case 'Help & Support':
        iconColor = Colors.purple;
        bgColor = Colors.purple;
        break;
      case 'About':
        iconColor = Colors.teal;
        bgColor = Colors.teal;
        break;
      default:
        iconColor = Theme.of(context).colorScheme.primary;
        bgColor = Theme.of(context).colorScheme.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: bgColor.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: bgColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
          child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title - Coming soon'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
      ),
    );
  }
}
