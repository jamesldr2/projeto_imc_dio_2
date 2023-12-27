import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dio_imc/src/view/controllers/home_controller.dart';
import 'package:flutter_dio_imc/src/view/widgets/calculate_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final pesoController = TextEditingController();

  final alturaController = TextEditingController();

  final pageController = HomeController();

  bool get canCalculate {
    return pesoController.text.isNotEmpty && alturaController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Calculadora IMC';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        bottomNavigationBar: CalculateButton(
          canCalculate: canCalculate,
          pesoController: pesoController,
          alturaController: alturaController,
          onPressed: () {
            final peso = double.parse(pesoController.text);
            final altura = double.parse(alturaController.text);
            pageController.addImcResult(peso, altura);
          },
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: pesoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insira o seu peso',
                      suffix: Text('kg'),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d*$'),
                      ),
                    ],
                    onChanged: (value) => setState(() {}),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: alturaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insira a sua altura',
                      suffix: Text('m'),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d*$'),
                      ),
                    ],
                    onChanged: (value) => setState(() {}),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                  ),
                  ListenableBuilder(
                    listenable: pageController,
                    builder: (context, value) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pageController.imcResults.length,
                        itemBuilder: (context, index) {
                          final imcResult = pageController.imcResults[index];
                          return ListTile(
                            dense: true,
                            title: Text(imcResult.imc),
                            trailing: Text(imcResult.category),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
