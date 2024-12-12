import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CognitoService {
  static final CognitoService _instance = CognitoService._internal();

  factory CognitoService() {
    return _instance;
  }

  CognitoService._internal();

  final userPool = CognitoUserPool(
    const String.fromEnvironment('COGNITO_POOL_ID',
        defaultValue: 'us-east-1_hHwjYcWPq'), // Get from environment
    const String.fromEnvironment('COGNITO_CLIENT_ID',
        defaultValue: '383bck5lr92lsudm995ap6rt9k'), // Get from environment
  );

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Generate a unique username since email cannot be used directly
  String _generateUsername(String email) {
    return email; // Use email directly as username to avoid InvalidParameterException
  }

  Future<CognitoUser?> getCurrentUser() async {
    try {
      return await userPool.getCurrentUser();
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  // Get Cognito User ID (Sub)
  Future<String?> getUserId() async {
    try {
      final attributes = await getUserAttributes();
      if (attributes == null) return null;

      final subAttribute = attributes.firstWhere(
        (attr) => attr.name == 'sub',
        orElse: () => throw Exception('Sub attribute not found'),
      );
      return subAttribute.value;
    } catch (e) {
      print('Error getting user ID: $e');
      return null;
    }
  }

  Future<List<CognitoUserAttribute>?> getUserAttributes() async {
    try {
      final cognitoUser = await getCurrentUser();
      if (cognitoUser == null) {
        throw Exception('No authenticated user found');
      }
      return await cognitoUser.getUserAttributes();
    } catch (e) {
      print('Error getting user attributes: $e');
      return null;
    }
  }

  // Get current user's email address
  static Future<String?> getCurrentUserEmail() async {
    try {
      final attributes = await CognitoService().getUserAttributes();
      if (attributes == null) return null;

      final emailAttribute = attributes.firstWhere(
        (attr) => attr.name == 'email',
        orElse: () => throw Exception('Email attribute not found'),
      );
      return emailAttribute.value;
    } catch (e) {
      print('Error getting user email: $e');
      return null;
    }
  }

  Future<bool?> signUp(String email, String password, String text,
      {required Map<String, String> userAttributes}) async {
    try {
      final username = _generateUsername(email);
      // Creating list of attributes from the user profile data
      final cognitoAttributes = [
        AttributeArg(name: 'email', value: email),
        // Add any additional required attributes from userAttributes map
        for (var entry in userAttributes.entries)
          AttributeArg(name: entry.key, value: entry.value)
      ];

      final result = await userPool.signUp(
        username,
        password,
        userAttributes: cognitoAttributes,
      );

      // Create user document in Firestore
      await _firestore.collection('users').doc(email).set({
        'email': email,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return result.userConfirmed;
    } catch (e) {
      print('Error during sign up: $e');
      return false;
    }
  }

  Future<bool> confirmSignUp(String email, String confirmationCode) async {
    try {
      final username = _generateUsername(email);
      final cognitoUser = CognitoUser(username, userPool);
      return await cognitoUser.confirmRegistration(confirmationCode);
    } catch (e) {
      print('Error during confirmation: $e');
      return false;
    }
  }

  Future<CognitoUserSession?> signIn(String email, String password) async {
    try {
      final username = _generateUsername(email);
      final cognitoUser = CognitoUser(username, userPool);
      final authDetails = AuthenticationDetails(
        username: username,
        password: password,
      );

      final session = await cognitoUser.authenticateUser(authDetails);

      // Store login time in Firestore
      await _firestore.collection('users').doc(email).set({
        'lastLoginTime': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return session;
    } catch (e) {
      print('Error during sign in: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      final currentUser = await userPool.getCurrentUser();
      if (currentUser != null) {
        await currentUser.signOut();
      }
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  // Request password reset code
  Future<bool> forgotPassword(String email) async {
    try {
      final username = _generateUsername(email);
      final cognitoUser = CognitoUser(username, userPool);
      await cognitoUser.forgotPassword();
      return true;
    } catch (e) {
      print('Error requesting password reset: $e');
      return false;
    }
  }

  // Confirm password reset with code and new password
  Future<bool> confirmForgotPassword(
      String email, String confirmationCode, String newPassword) async {
    try {
      final username = _generateUsername(email);
      final cognitoUser = CognitoUser(username, userPool);
      await cognitoUser.confirmPassword(confirmationCode, newPassword);
      return true;
    } catch (e) {
      print('Error confirming password reset: $e');
      return false;
    }
  }

  static Future<String?> getCurrentUserId() async {
    try {
      return await CognitoService().getUserId();
    } catch (e) {
      print('Error getting current user ID: $e');
      return null;
    }
  }
}
