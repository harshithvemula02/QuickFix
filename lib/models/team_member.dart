class TeamMember {
  final String id;
  final String name;
  final String role;
  final String designation;
  final String? photoUrl;
  final String? email;
  final String? phone;

  const TeamMember({
    required this.id,
    required this.name,
    required this.role,
    required this.designation,
    this.photoUrl,
    this.email,
    this.phone,
  });
}
