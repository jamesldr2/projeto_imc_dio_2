class ImcHelper {
  final double _peso;
  final double _altura;

  ImcHelper(this._peso, this._altura);

  double calcularImc() {
    return _peso / (_altura * _altura);
  }

  String getResultado() {
    double imc = calcularImc();
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc <= 24.9) {
      return "Peso normal";
    } else if (imc >= 25 && imc <= 29.9) {
      return "Sobrepeso";
    } else if (imc >= 30 && imc <= 34.9) {
      return "Obesidade grau 1";
    } else if (imc >= 35 && imc <= 39.9) {
      return "Obesidade grau 2";
    } else {
      return "Obesidade grau 3";
    }
  }

  String getImc() {
    return calcularImc().toStringAsFixed(2);
  }
}
