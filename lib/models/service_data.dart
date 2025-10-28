import 'service.dart';

class ServiceData {
  static const List<Service> services = [
    Service(
      id: 'plumber',
      name: 'Plumber',
      description: 'Expert plumbing services for leaks, repairs, installations, and maintenance',
      icon: 'plumbing',
      color: '0xFF2196F3',
      features: ['Leak Repair', 'Pipe Installation', 'Drain Cleaning', 'Fixture Repair'],
      estimatedTime: '1-3 hours',
      priceRange: '₹500 - ₹2000',
    ),
    Service(
      id: 'electrician',
      name: 'Electrician',
      description: 'Professional electrical work including wiring, repairs, and installations',
      icon: 'electrical_services',
      color: '0xFFFF9800',
      features: ['Wiring', 'Outlet Installation', 'Circuit Repair', 'Light Fixtures'],
      estimatedTime: '2-4 hours',
      priceRange: '₹800 - ₹3000',
    ),
    Service(
      id: 'carpenter',
      name: 'Carpenter',
      description: 'Skilled carpentry work for furniture, repairs, and custom woodwork',
      icon: 'build',
      color: '0xFF795548',
      features: ['Furniture Repair', 'Custom Woodwork', 'Door Installation', 'Shelf Building'],
      estimatedTime: '3-6 hours',
      priceRange: '₹1000 - ₹5000',
    ),
    Service(
      id: 'painter',
      name: 'Painter',
      description: 'Professional painting services for interior and exterior walls',
      icon: 'format_paint',
      color: '0xFFE91E63',
      features: ['Interior Painting', 'Exterior Painting', 'Wall Preparation', 'Color Consultation'],
      estimatedTime: '4-8 hours',
      priceRange: '₹2000 - ₹8000',
    ),
    Service(
      id: 'cleaning',
      name: 'Cleaning & Housekeeping',
      description: 'Comprehensive cleaning services for homes and offices',
      icon: 'cleaning_services',
      color: '0xFF4CAF50',
      features: ['Deep Cleaning', 'Regular Maintenance', 'Window Cleaning', 'Carpet Cleaning'],
      estimatedTime: '2-6 hours',
      priceRange: '₹800 - ₹4000',
    ),
    Service(
      id: 'catering',
      name: 'Catering & Food',
      description: 'Professional catering services for events and special occasions',
      icon: 'restaurant',
      color: '0xFFFF5722',
      features: ['Event Catering', 'Home Delivery', 'Custom Menus', 'Party Planning'],
      estimatedTime: '2-8 hours',
      priceRange: '₹1500 - ₹10000',
    ),
    Service(
      id: 'labour',
      name: 'Labour & General Help',
      description: 'General labor services for moving, lifting, and various tasks',
      icon: 'work',
      color: '0xFF607D8B',
      features: ['Moving Help', 'Heavy Lifting', 'General Labor', 'Event Setup'],
      estimatedTime: '1-4 hours',
      priceRange: '₹500 - ₹2500',
    ),
    Service(
      id: 'ac_repair',
      name: 'AC & Appliance Repair',
      description: 'Expert repair services for air conditioners and home appliances',
      icon: 'ac_unit',
      color: '0xFF00BCD4',
      features: ['AC Repair', 'Appliance Service', 'Maintenance', 'Installation'],
      estimatedTime: '1-3 hours',
      priceRange: '₹800 - ₹3000',
    ),
  ];

  static Service getServiceById(String id) {
    return services.firstWhere((service) => service.id == id);
  }

  static List<Service> getPopularServices() {
    return services.take(4).toList();
  }
}
