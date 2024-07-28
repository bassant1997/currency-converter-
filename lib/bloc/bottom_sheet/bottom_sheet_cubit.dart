import 'package:currency_converter/bloc/bottom_sheet/bottom_sheet_state.dart';
import 'package:currency_converter/bloc/currency/list_currency_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/database/hive_helper.dart';
import '../../data/models/currency_model.dart';
import '../currency/list_currency_bloc.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetState());

  void navigateTo(int newIndex) async {
    emit(BottomSheetState(index: newIndex));
  }
}
