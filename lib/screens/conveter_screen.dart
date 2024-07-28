import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/converter_card.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Converter',
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Material(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: double.maxFinite),
                  ),
                ),
                ConverterCard.create(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
