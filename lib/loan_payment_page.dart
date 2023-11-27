import 'package:flutter/material.dart';

class LoanPaymentPage extends StatelessWidget {
  final double loanAmount;
  final double interestRate = 0.1;
  late final int numberOfYears;

  LoanPaymentPage({Key? key, required this.loanAmount}) : super(key: key) {
    // Calculate the number of years based on the loan amount
    numberOfYears = calculateNumberOfYears();
  }

  @override
  Widget build(BuildContext context) {
    double yearlyPayment = calculateYearlyPayment();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Loan Details'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image2.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFormat('Loan Amount: $loanAmount'),
                textFormat('Interest Rate: ${(interestRate * 100).toStringAsFixed(2)}%'),
                textFormat('Number of Years: $numberOfYears'),
                textFormat('Yearly Payment: $yearlyPayment'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormat(String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(text, style: const TextStyle(fontSize: 20.0,),
      ),
    );
  }

  double calculateYearlyPayment() {

    double totalPayment = loanAmount * (1 + interestRate);

    return totalPayment / numberOfYears;
  }

  int calculateNumberOfYears() {

    if (loanAmount <= 1000) {
      return 3;
    } else if (loanAmount <= 5000) {
      return 5;
    } else {
      return 10;
    }
  }
}
