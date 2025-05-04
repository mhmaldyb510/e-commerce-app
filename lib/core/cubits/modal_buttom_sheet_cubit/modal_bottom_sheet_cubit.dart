import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'modal_bottom_sheet_state.dart';

class ModalBottomSheetCubit extends Cubit<ModalBottomSheetState> {
  ModalBottomSheetCubit() : super(ModalBottomSheetInitial());

  bool isModalSheetOpened = false;

  updateModalSheetState(bool value) {
    isModalSheetOpened = value;
    emit(ModalBottomSheetInitial());
  }
}
