import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'All Events';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // Filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Explore events near you',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),

          // Tabs
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Today'),
                Tab(text: 'Tomorrow'),
                Tab(text: 'Weekend'),
              ],
            ),
          ),

          // Filter chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All Events', Icons.event),
                  const SizedBox(width: 8),
                  _buildFilterChip('New groups', Icons.group_add),
                  const SizedBox(width: 8),
                  _buildFilterChip('Social Activities', Icons.celebration),
                  const SizedBox(width: 8),
                  _buildFilterChip('Hobbies', Icons.sports_basketball),
                ],
              ),
            ),
          ),

          // Events list
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildEventsList(),
                _buildEventsList(),
                _buildEventsList(),
                _buildEventsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    final isSelected = _selectedFilter == label;
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? Colors.white : Colors.black87,
          ),
          const SizedBox(width: 4),
          Text(label),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = label;
        });
      },
      backgroundColor: Colors.white,
      selectedColor: Theme.of(context).colorScheme.primary,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black87,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[300]!,
        ),
      ),
    );
  }

  Widget _buildEventsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildEventCard(
          title: 'Yoga & Meditation by the Harbour',
          schedule: 'Every Sunday at 8:00 AM (AEDT)',
          location: 'Royal Botanic Gardens, Sydney NSW',
          distance: '3.2 km',
          rating: 4.8,
          attendees: 24,
          imageUrl:
              'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=800&q=80',
          tags: ['Wellness', 'Meditation', 'Outdoor', 'Mindfulness'],
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          title: 'Melbourne Tech & Startup Networking',
          schedule: 'Friday, October 18 at 6:00 PM AEDT',
          location: 'Hub Melbourne, 1 Docklands',
          distance: '5.4 km',
          rating: 4.6,
          attendees: 45,
          imageUrl:
              'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800&q=80',
          tags: ['Business', 'Networking', 'Technology', 'Startups'],
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          title: 'Bondi Beach Fitness Bootcamp',
          schedule: 'Saturday & Sunday at 6:30 AM',
          location: 'Bondi Beach, Sydney NSW 2026',
          distance: '8.5 km',
          rating: 4.9,
          attendees: 32,
          imageUrl:
              'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?w=800&q=80',
          tags: ['Fitness', 'Health', 'Beach', 'Outdoor'],
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          title: 'Brisbane Coffee & Code Meetup',
          schedule: 'Thursday, October 17 at 10:00 AM',
          location: 'The Coffee Club, Queen Street Mall Brisbane',
          distance: '2.8 km',
          rating: 4.5,
          attendees: 18,
          imageUrl:
              'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&q=80',
          tags: ['Technology', 'Coding', 'Social', 'Learning'],
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          title: 'Perth Art & Wine Evening',
          schedule: 'Saturday, October 19 at 7:00 PM',
          location: 'Art Gallery of Western Australia, Perth',
          distance: '4.1 km',
          rating: 4.7,
          attendees: 28,
          imageUrl:
              'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?w=800&q=80',
          tags: ['Art', 'Social', 'Culture', 'Wine'],
        ),
        const SizedBox(height: 16),
        _buildEventCard(
          title: 'Adelaide Foodies Walking Tour',
          schedule: 'Every Saturday at 11:00 AM',
          location: 'Central Market, Adelaide SA 5000',
          distance: '1.6 km',
          rating: 4.9,
          attendees: 15,
          imageUrl:
              'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800&q=80',
          tags: ['Food', 'Social', 'Walking', 'Culture'],
        ),
      ],
    );
  }

  Widget _buildEventCard({
    required String title,
    required String schedule,
    required String location,
    required String distance,
    required double rating,
    required int attendees,
    required String imageUrl,
    required List<String> tags,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event image with overlay
          Stack(
            children: [
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors
                              .primaries[title.hashCode %
                                  Colors.primaries.length]
                              .withOpacity(0.7),
                          Colors
                              .primaries[(title.hashCode + 5) %
                                  Colors.primaries.length]
                              .withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.event,
                        size: 80,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
              // Action buttons on image
              Positioned(
                top: 12,
                right: 12,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.share, size: 20),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border, size: 20),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              // Attendees badge
              if (attendees > 0)
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.people, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$attendees going',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          // Event details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Schedule
                Text(
                  schedule,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 12),

                // Location and rating
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (rating > 0) ...[
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
                if (distance.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    distance,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
                const SizedBox(height: 12),

                // Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
