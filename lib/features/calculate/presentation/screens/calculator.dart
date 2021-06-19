import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';
import 'package:flutter_otoczka/core/presentation/widgets/default_error_screen.dart';
import 'package:flutter_otoczka/features/calculate/presentation/blocs/calculate/calculate_bloc.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_points_section.dart';
import 'package:flutter_otoczka/features/calculate/presentation/widgets/calculator_title.dart';
import 'package:flutter_otoczka/injection_container.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late final CalculateBloc calculateBloc;

  @override
  void initState() {
    calculateBloc = sl()..add(InitializePlaneEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: calculateBloc,
        builder: (context, state) {
          if (state is InitialCalculateState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorInitializationCalculateState) {
            return DefaultErrorScreen();
          } else if (state is CalculateDataState) {
            return Scaffold(
              body: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: 350,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Neumorphic(
                        style: NeumorphicStyle(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CalculatorTitle(),
                                CalculatorPointsSection(
                                  points: state.plane.points,
                                  onChanged: (point) => calculateBloc.add(UpdatePlaneEvent(point: point)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
