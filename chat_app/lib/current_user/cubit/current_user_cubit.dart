import 'package:chat_app/current_user/repository/current_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:user_repository/user_repository.dart';

///TODO migrate to HydrateBloc?
class CurrentUserCubit extends Cubit<User?> {

  CurrentUserCubit({required this.currentUserRepository, UserRepository? userRepository}) : 
    _userRepository = userRepository ?? UserRepository(),
    super(null);

  final CurrentUserRepository currentUserRepository;
  final UserRepository _userRepository;

  Future<void> init() async {
    await currentUserRepository.init();
    final userId = currentUserRepository.getUserId();
    if (userId != null) {
      final user = await _userRepository.getUser(userId);
      emit(user);
    } else {
      emit(null);
    }
  }

  void add(User user) {
    currentUserRepository.setUserId(user.id);
    emit(user);
  }

  void addGroup(Group group) {
    emit(state?.copyWith(groups: List.of(state?.groups ?? [])..add(group)));
  }


  void remove() {
    currentUserRepository.removeId();
    emit(null);
  }
  
}