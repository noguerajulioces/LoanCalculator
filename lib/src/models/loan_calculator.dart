import 'dart:math';

class LoanCalculator {
  double calculateMonthlyPayment(
      double amount, double interestRate, int duration) {
    double monthlyInterestRate = interestRate / 12 / 100;
    if (monthlyInterestRate == 0) {
      return amount / duration;
    } else {
      return amount *
          monthlyInterestRate /
          (1 - pow(1 + monthlyInterestRate, -duration));
    }
  }

  double calculateTotalPayment(double monthlyPayment, int duration) {
    return monthlyPayment * duration;
  }

  double calculateTotalInterest(double totalPayment, double amount) {
    return totalPayment - amount;
  }
}
