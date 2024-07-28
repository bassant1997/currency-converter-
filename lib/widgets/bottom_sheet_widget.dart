import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_sheet/bottom_sheet_cubit.dart';
import '../bloc/bottom_sheet/bottom_sheet_state.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomSheetCubit, BottomSheetState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (index) =>
              BlocProvider.of<BottomSheetCubit>(context).navigateTo(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_bitcoin_rounded),
                label: 'Currencies'),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange),
              label: 'Converter',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History')
          ],
        );
      },
    );
  }
}
