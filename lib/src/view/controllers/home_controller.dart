import 'package:flutter/material.dart';
import 'package:flutter_dio_imc/src/domain/entities/imc_result.dart';
import 'package:flutter_dio_imc/src/helpers/imc_helper.dart';

class HomeController extends ChangeNotifier {
  List<ImcResult> imcResults = [];

  void addImcResult(double peso, double altura) {
    if (altura == 0) return;
    if (peso == 0) return;
    if (altura > 4) return;
    final helper = ImcHelper(peso, altura);
    final result = ImcResult(helper.getImc(), helper.getResultado());
    if (double.parse(result.imc) == 0) return;

    imcResults.add(result);
    notifyListeners();
  }
}
