import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/model/user.dart';
import 'package:trips/User/repository/auth_repository.dart';
import 'package:trips/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  // Stream Controller
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;
  // Casos de uso de objeto User

  // 1. Iniciar sesión al app con Google
  Future<UserCredential> signIn() => _auth_repository.signInFirebase();

  // 2. Cerrar sesión
  signOut() => _auth_repository.signOut();

  // 3. Registrar usuario en BD
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  updateUserData(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
