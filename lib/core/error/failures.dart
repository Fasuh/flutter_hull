import 'package:equatable/equatable.dart';
import 'package:flutter_otoczka/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get errorMessage => S.current.defaultError;
}

class DefaultCalculateFailure extends Failure {}