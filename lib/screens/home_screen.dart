import 'package:currency_converter/bloc/bottom_sheet/bottom_sheet_state.dart';
import 'package:currency_converter/screens/conveter_screen.dart';
import 'package:currency_converter/screens/currencies_screen.dart';
import 'package:currency_converter/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_sheet/bottom_sheet_cubit.dart';
import '../config/themes/app_style.dart';
import '../widgets/bottom_sheet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const CurrenciesScreen(),
      const ConverterScreen(),
      HistoryScreen.create()
    ];
    return BlocProvider(
      create: (_) => BottomSheetCubit(),
      child: Scaffold(
        backgroundColor: AppThemes.whiteColor,
        body: BlocBuilder<BottomSheetCubit, BottomSheetState>(
          builder: (context, state) {
            return screens[state.index];
          },
        ),
        bottomNavigationBar: const BottomSheetWidget(),
      ),
    );
  }
}
