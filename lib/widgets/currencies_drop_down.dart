import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currency/list_currency_bloc.dart';
import '../bloc/currency/list_currency_state.dart';
import '../config/themes/app_style.dart';
import '../config/themes/app_text_style.dart';
import '../data/models/currency_model.dart';

class CurrenciesDropDown extends StatefulWidget {
  const CurrenciesDropDown(
      {super.key, required this.label, required this.onSelected, this.hint});

  final String label;
  final String? hint;
  final Function(Currency?) onSelected;

  @override
  State<CurrenciesDropDown> createState() => _CurrenciesDropDownState();
}

class _CurrenciesDropDownState extends State<CurrenciesDropDown> {
  String? selectedCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: AppTextStyle.smallPrimary12,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppThemes.primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              child: BlocBuilder<SupportedCurrenciesBloc, SupportedCurrencyState>(
                builder: (context, state) {
                  return state.isCompleted
                      ? DropdownButton<Currency>(
                          style: AppTextStyle.normalBlack16,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: selectedCode == null
                                ? Text(
                                    widget.hint ?? '',
                                    style: AppTextStyle.hintStyle,
                                  )
                                : Text(
                                    selectedCode ?? '',
                                    style: AppTextStyle.hintStyle,
                                  ),
                          ),
                          items: state.currencyList!.map((Currency value) {
                            return DropdownMenuItem<Currency>(
                              value: value,
                              child: Text(
                                value.currencyCode!,
                                style: AppTextStyle.smallBlack12,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                           setState(() {
                             selectedCode = value!.currencyCode;
                           });
                           widget.onSelected(value);
                          },
                        )
                      : const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
