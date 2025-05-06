import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  final UserRepository _userRepository;
  SignInBloc({
    required  UserRepository userRepository
  }) : _userRepository = userRepository,
        super(SignInInitial()){
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } on FirebaseAuthException catch(e){
        emit(SignInFailure(e.code));
      }
      catch (e) {
        emit(SignInFailure(e.toString()));
      }
    });

    on<SignOutRequired>((event, emit) async{

      emit(SignOutProcess());
      try {
        await _userRepository.signOut();
        emit(SignOutSuccess());
      } on FirebaseAuthException catch(e){
        emit(SignOutFailure(e.code));
      }
      catch (e) {
        emit(SignOutFailure(e.toString()));
      }
    });
  }
}