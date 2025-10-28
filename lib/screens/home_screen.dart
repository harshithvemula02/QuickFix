import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/team_member.dart';
import '../models/team_data.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const ServicesTab(),
    const AboutContactTab(),
    const UpdatesTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
    return Scaffold(
          body: SafeArea(
            child: _screens[_currentIndex],
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF1976D2),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
                label: 'About',
          ),
          BottomNavigationBarItem(
                icon: Icon(Icons.update),
                label: 'Updates',
          ),
          BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
          ),
        ],
      ),
        );
      },
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                const SizedBox(height: 40), // Increased from 20 to 40
            
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to QuickFix!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your trusted local service solution for all home needs',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to services tab
                    },
                    icon: const Icon(Icons.explore),
                    label: const Text('Explore Services'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1976D2),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Stats Section
            const Text(
              'Why Choose QuickFix?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.speed,
                    title: 'Quick Response',
                    subtitle: '24/7 availability',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.verified_user,
                    title: 'Trusted Workers',
                    subtitle: 'Verified professionals',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.attach_money,
                    title: 'Fair Pricing',
                    subtitle: 'Transparent costs',
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.star,
                    title: 'Quality Work',
                    subtitle: '5-star service',
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Popular Services Section
            const Text(
              'Popular Services',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 16),
            
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildServiceCard(
                    icon: Icons.plumbing,
                    title: 'Plumbing',
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 12),
                  _buildServiceCard(
                    icon: Icons.electrical_services,
                    title: 'Electrical',
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  _buildServiceCard(
                    icon: Icons.build,
                    title: 'Carpentry',
                    color: Colors.brown,
                  ),
                  const SizedBox(width: 12),
                  _buildServiceCard(
                    icon: Icons.cleaning_services,
                    title: 'Cleaning',
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Call to Action
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.phone,
                    size: 48,
                    color: Color(0xFF1976D2),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Need Help Right Now?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Call us for immediate assistance',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle call action
                    },
                    child: const Text('Call Now'),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.work_outline,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Professional Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Find the right service for your needs',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Services List
            ..._getServicesList().map((service) => _buildServiceCard(context, service)),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<ServiceItem> _getServicesList() {
    return [
      ServiceItem(
        id: 'plumber',
        name: 'Plumber',
        description: 'Expert plumbing services for leaks, repairs, installations, and maintenance',
        icon: Icons.plumbing,
        color: Colors.blue,
        features: ['Leak Repair', 'Pipe Installation', 'Drain Cleaning', 'Fixture Repair'],
        estimatedTime: '1-3 hours',
        priceRange: '₹500 - ₹2000',
      ),
      ServiceItem(
        id: 'electrician',
        name: 'Electrician',
        description: 'Professional electrical work including wiring, repairs, and installations',
        icon: Icons.electrical_services,
        color: Colors.orange,
        features: ['Wiring', 'Outlet Installation', 'Circuit Repair', 'Light Fixtures'],
        estimatedTime: '2-4 hours',
        priceRange: '₹800 - ₹3000',
      ),
      ServiceItem(
        id: 'carpenter',
        name: 'Carpenter',
        description: 'Skilled carpentry work for furniture, repairs, and custom woodwork',
        icon: Icons.build,
        color: Colors.brown,
        features: ['Furniture Repair', 'Custom Woodwork', 'Door Installation', 'Shelf Building'],
        estimatedTime: '3-6 hours',
        priceRange: '₹1000 - ₹5000',
      ),
      ServiceItem(
        id: 'painter',
        name: 'Painter',
        description: 'Professional painting services for interior and exterior walls',
        icon: Icons.format_paint,
        color: Colors.purple,
        features: ['Interior Painting', 'Exterior Painting', 'Wall Preparation', 'Color Consultation'],
        estimatedTime: '4-8 hours',
        priceRange: '₹2000 - ₹8000',
      ),
      ServiceItem(
        id: 'cleaning',
        name: 'Cleaning & Housekeeping',
        description: 'Comprehensive cleaning services for homes and offices',
        icon: Icons.cleaning_services,
        color: Colors.green,
        features: ['Deep Cleaning', 'Regular Maintenance', 'Window Cleaning', 'Carpet Cleaning'],
        estimatedTime: '2-6 hours',
        priceRange: '₹800 - ₹4000',
      ),
      ServiceItem(
        id: 'catering',
        name: 'Catering & Food',
        description: 'Professional catering services for events and special occasions',
        icon: Icons.restaurant,
        color: Colors.red,
        features: ['Event Catering', 'Home Delivery', 'Custom Menus', 'Party Planning'],
        estimatedTime: '2-8 hours',
        priceRange: '₹1500 - ₹10000',
      ),
      ServiceItem(
        id: 'labour',
        name: 'Labour & General Help',
        description: 'General labor services for moving, lifting, and various tasks',
        icon: Icons.work,
        color: Colors.grey,
        features: ['Moving Help', 'Heavy Lifting', 'General Labor', 'Event Setup'],
        estimatedTime: '1-4 hours',
        priceRange: '₹500 - ₹2500',
      ),
      ServiceItem(
        id: 'ac_repair',
        name: 'AC & Appliance Repair',
        description: 'Expert repair services for air conditioners and home appliances',
        icon: Icons.ac_unit,
        color: Colors.cyan,
        features: ['AC Repair', 'Appliance Service', 'Maintenance', 'Installation'],
        estimatedTime: '1-3 hours',
        priceRange: '₹800 - ₹3000',
      ),
    ];
  }

  Widget _buildServiceCard(BuildContext context, ServiceItem service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
                  onTap: () => _showServiceDetails(context, service),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  service.color.withValues(alpha: 0.1),
                  service.color.withValues(alpha: 0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: service.color.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        service.icon,
                        size: 28,
                        color: service.color,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1976D2),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Features
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: service.features.take(3).map((feature) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: service.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: service.color.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 11,
                          color: service.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 16),
                
                // Bottom Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Time
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          service.estimatedTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    
                    // Price
                    Text(
                      service.priceRange,
                      style: TextStyle(
                        fontSize: 14,
                        color: service.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Contact Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _showServiceDetails(context, service),
                    icon: const Icon(Icons.phone, size: 16),
                    label: const Text('Contact Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: service.color,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showServiceDetails(BuildContext context, ServiceItem service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ServiceDetailsSheet(service: service),
    );
  }
}

class ServiceDetailsSheet extends StatelessWidget {
  final ServiceItem service;

  const ServiceDetailsSheet({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: service.color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          service.icon,
                          size: 32,
                          color: service.color,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1976D2),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              service.description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Features Section
                  const Text(
                    'What We Offer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  ...service.features.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 20,
                          color: service.color,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )),
                  
                  const SizedBox(height: 24),
                  
                  // Service Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Estimated Time:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              service.estimatedTime,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: service.color,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price Range:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              service.priceRange,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: service.color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Calling ${service.name}...'),
                                backgroundColor: service.color,
                              ),
                            );
                          },
                          icon: const Icon(Icons.phone),
                          label: const Text('Call Now'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: service.color,
                            side: BorderSide(color: service.color),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Messaging ${service.name}...'),
                                backgroundColor: service.color,
                              ),
                            );
                          },
                          icon: const Icon(Icons.message),
                          label: const Text('Message'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: service.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;
  final String estimatedTime;
  final String priceRange;

  const ServiceItem({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
    required this.estimatedTime,
    required this.priceRange,
  });
}


class AboutContactTab extends StatefulWidget {
  const AboutContactTab({super.key});

  @override
  State<AboutContactTab> createState() => _AboutContactTabState();
}

class _AboutContactTabState extends State<AboutContactTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.business,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'QuickFix',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your trusted local service solution',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Project Details Section
            const Text(
              'About QuickFix',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 12),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project Overview',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'QuickFix is a cross-platform Flutter app designed to help users find local workers for small home issues such as plumbing, electrical work, catering, labour, and more.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...const [
                    '• Easy service discovery',
                    '• Professional worker profiles',
                    '• Quick contact and booking',
                    '• Transparent pricing',
                    '• Quality assurance',
                  ].map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Team Members Section
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 12),
            
            ...TeamData.teamMembers.map((member) => _buildTeamMemberCard(member)),
            
            const SizedBox(height: 24),
            
            // Contact Form Section
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 12),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Email Field
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Message Field
                    TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        prefixIcon: Icon(Icons.message),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _submitForm,
                        icon: const Icon(Icons.send),
                        label: const Text('Send Message'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Contact Information
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.email, color: Color(0xFF1976D2)),
                      const SizedBox(width: 8),
                      const Text('info@quickfix.com'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Color(0xFF1976D2)),
                      const SizedBox(width: 8),
                      const Text('+91 98765 43210'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF1976D2)),
                      const SizedBox(width: 8),
                      const Text('Available in your city'),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(TeamMember member) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.person,
              size: 30,
              color: Color(0xFF1976D2),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Member Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1976D2),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  member.designation,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (member.email != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    member.email!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Role Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF1976D2).withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              member.role,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message sent successfully! We\'ll get back to you soon.'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      
      // Print to console as requested
      print('Contact Form Submitted:');
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Message: ${_messageController.text}');
    }
  }
}

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updates'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            // Header Section
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.update,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Latest Updates',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Stay informed about our latest features and announcements',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Updates List
            ..._getUpdatesList().map((update) => _buildUpdateCard(update)),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<UpdateItem> _getUpdatesList() {
    return [
      UpdateItem(
        id: '1',
        title: 'New Service Categories Added',
        description: 'We\'ve added AC & Appliance Repair services to our platform. Now you can find qualified technicians for all your home appliance needs.',
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: UpdateType.feature,
        isNew: true,
      ),
      UpdateItem(
        id: '2',
        title: 'Improved User Interface',
        description: 'Our app now features a cleaner, more intuitive design with better navigation and faster loading times.',
        date: DateTime.now().subtract(const Duration(days: 5)),
        type: UpdateType.improvement,
        isNew: false,
      ),
      UpdateItem(
        id: '3',
        title: 'Expanded Service Areas',
        description: 'QuickFix is now available in 5 additional cities. Check if we\'re available in your area!',
        date: DateTime.now().subtract(const Duration(days: 8)),
        type: UpdateType.announcement,
        isNew: false,
      ),
      UpdateItem(
        id: '4',
        title: 'Customer Support Hours Extended',
        description: 'Our customer support team is now available 24/7 to assist you with any queries or issues.',
        date: DateTime.now().subtract(const Duration(days: 12)),
        type: UpdateType.service,
        isNew: false,
      ),
      UpdateItem(
        id: '5',
        title: 'Welcome to QuickFix!',
        description: 'Thank you for choosing QuickFix. We\'re excited to help you find the right service providers for all your home needs.',
        date: DateTime.now().subtract(const Duration(days: 15)),
        type: UpdateType.welcome,
        isNew: false,
      ),
    ];
  }

  Widget _buildUpdateCard(UpdateItem update) {
    Color cardColor;
    IconData iconData;
    
    switch (update.type) {
      case UpdateType.feature:
        cardColor = Colors.green;
        iconData = Icons.new_releases;
        break;
      case UpdateType.improvement:
        cardColor = Colors.blue;
        iconData = Icons.upgrade;
        break;
      case UpdateType.announcement:
        cardColor = Colors.orange;
        iconData = Icons.campaign;
        break;
      case UpdateType.service:
        cardColor = Colors.purple;
        iconData = Icons.support_agent;
        break;
      case UpdateType.welcome:
        cardColor = Colors.teal;
        iconData = Icons.waving_hand;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                cardColor.withValues(alpha: 0.1),
                cardColor.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              // Header Row
                  Row(
                    children: [
                      Container(
                    padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                      color: cardColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                      iconData,
                      size: 20,
                      color: cardColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                update.title,
                              style: const TextStyle(
                                  fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1976D2),
                              ),
                              ),
                            ),
                            if (update.isNew)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'NEW',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                          _formatDate(update.date),
                              style: TextStyle(
                            fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
              ),
              
              const SizedBox(height: 12),
              
              // Description
              Text(
                update.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    
    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '$difference days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

enum UpdateType {
  feature,
  improvement,
  announcement,
  service,
  welcome,
}

class UpdateItem {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final UpdateType type;
  final bool isNew;

  const UpdateItem({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.type,
    required this.isNew,
  });
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';
  String _selectedCity = 'Mumbai';

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _editProfile,
              ),
            ],
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  const Text(
                    'Ram ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  const SizedBox(height: 4),
                  
                  const Text(
                    'ram@email.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Premium User',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
                  ),
                  
                  const SizedBox(height: 24),
                  
            // Quick Stats
                  const Text(
              'Quick Stats',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1976D2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
            Row(
                      children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.history,
                    title: 'Services Used',
                    value: '12',
                    color: Colors.blue,
                  ),
                        ),
                        const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.star,
                    title: 'Rating Given',
                    value: '4.8',
                    color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.favorite,
                    title: 'Favorites',
                    value: '5',
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.schedule,
                    title: 'Pending',
                    value: '2',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
                  
                  const SizedBox(height: 24),
                  
            // Settings Section
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 12),
            
            // Dark Mode Toggle
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                      children: [
                  const Icon(Icons.dark_mode, color: Color(0xFF1976D2)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Dark Mode',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                  ),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: const Color(0xFF1976D2),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Notifications Toggle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.notifications, color: Color(0xFF1976D2)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Push Notifications',
                              style: TextStyle(
                                fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Switch(
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                    activeColor: const Color(0xFF1976D2),
                            ),
                          ],
                        ),
            ),
            
                        const SizedBox(height: 12),
            
            // Language Selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                          children: [
                  const Icon(Icons.language, color: Color(0xFF1976D2)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Language',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                  ),
                  DropdownButton<String>(
                    value: _selectedLanguage,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                    },
                    items: <String>['English', 'Hindi', 'Tamil', 'Telugu']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // City Selection
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_city, color: Color(0xFF1976D2)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Service City',
                              style: TextStyle(
                                fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCity = newValue!;
                      });
                    },
                    items: <String>['Hyderabad', 'Delhi', 'Bangalore', 'Chennai', 'Mumbai']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Action Buttons
            const Text(
              'Account Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1976D2),
              ),
            ),
            const SizedBox(height: 12),
            
            // Edit Profile Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _editProfile,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Service History Button
            SizedBox(
              width: double.infinity,
                        child: OutlinedButton.icon(
                onPressed: _viewServiceHistory,
                icon: const Icon(Icons.history),
                label: const Text('Service History'),
                          style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1976D2),
                  side: const BorderSide(color: Color(0xFF1976D2)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
            
            const SizedBox(height: 12),
            
            // Help & Support Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _openHelpSupport,
                icon: const Icon(Icons.help),
                label: const Text('Help & Support'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF1976D2),
                  side: const BorderSide(color: Color(0xFF1976D2)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
            
            const SizedBox(height: 12),
            
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: themeProvider.isDarkMode ? const Color(0xFF2D2D2D) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
        );
      },
    );
  }

  void _editProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit Profile feature coming soon!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _viewServiceHistory() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Service History feature coming soon!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _openHelpSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Help & Support feature coming soon!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
