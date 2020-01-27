extension MathCalcs on double{

  double factorial() {
    double total = 1.0;
    double i = 1.0;

    while (i <= this) {
      total = total * i;
      i = i + 1.0;
    }

    return total;
  }

}

double delta(double a, double b, double c){
  return (b * b) - 4 * a * c;
}