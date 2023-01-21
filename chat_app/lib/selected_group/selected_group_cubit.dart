import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

class SelectedGroupCubit extends Cubit<Group?> {

  SelectedGroupCubit() : super(null);

  void updateGroup(Group group) => emit(group);
}
