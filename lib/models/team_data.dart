import 'team_member.dart';

class TeamData {
  static const List<TeamMember> teamMembers = [
    TeamMember(
      id: 'harshith',
      name: 'Harshith',
      role: 'CEO',
      designation: 'Chief Executive Officer',
      email: 'harshith@quickfix.com',
      phone: '+91 98765 43210',
    ),
    TeamMember(
      id: 'ajay',
      name: 'Ajay',
      role: 'CMO',
      designation: 'Chief Marketing Officer',
      email: 'ajay@quickfix.com',
      phone: '+91 98765 43211',
    ),
    TeamMember(
      id: 'vamshi',
      name: 'Vamshi',
      role: 'CTO',
      designation: 'Chief Technology Officer',
      email: 'vamshi@quickfix.com',
      phone: '+91 98765 43212',
    ),
  ];

  static TeamMember getTeamMemberById(String id) {
    return teamMembers.firstWhere((member) => member.id == id);
  }
}
