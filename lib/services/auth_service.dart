import '../models/user_model.dart';

class AuthService {
  // Test credentials for different user types
  final List<Map<String, String>> _testUsers = [
    {
      'email': 'participant@test.com',
      'password': 'password123',
      'name': 'John Participant',
      'userType': 'NDIS Participant',
      'id': '1',
    },
    {
      'email': 'worker@test.com',
      'password': 'password123',
      'name': 'Sarah Worker',
      'userType': 'Support Worker',
      'id': '2',
    },
    {
      'email': 'provider@test.com',
      'password': 'password123',
      'name': 'ABC Service Provider',
      'userType': 'Service Provider',
      'id': '3',
    },
    {
      'email': 'coordinator@test.com',
      'password': 'password123',
      'name': 'Mike Coordinator',
      'userType': 'LAC / Support Coordinator',
      'id': '4',
    },
  ];

  // Simulated login with test credentials
  Future<Map<String, dynamic>> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if credentials match any test user
    for (var testUser in _testUsers) {
      if (testUser['email'] == email && testUser['password'] == password) {
        final user = User(
          id: testUser['id']!,
          name: testUser['name']!,
          email: testUser['email']!,
          userType: testUser['userType']!,
        );
        return {
          'success': true,
          'user': user,
          'message': 'Login successful',
        };
      }
    }

    // If no match found
    return {
      'success': false,
      'user': null,
      'message': 'Invalid email or password',
    };
  }

  // Simulated signup
  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
    String userType,
  ) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if email already exists
    for (var testUser in _testUsers) {
      if (testUser['email'] == email) {
        return {
          'success': false,
          'user': null,
          'message': 'Email already exists',
        };
      }
    }

    // Create new user
    final newUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      userType: userType,
    );

    // Add to test users list (for demonstration)
    _testUsers.add({
      'email': email,
      'password': password,
      'name': name,
      'userType': userType,
      'id': newUser.id,
    });

    return {
      'success': true,
      'user': newUser,
      'message': 'Account created successfully',
    };
  }

  // Get current user (for future implementation)
  User? getCurrentUser() {
    // This would normally retrieve the logged-in user from storage
    return null;
  }

  // Logout
  Future<void> logout() async {
    // This would normally clear stored credentials
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
