import 'package:flutter/material.dart';
import 'loan_payment_page.dart';

class LoanDetailsPage extends StatefulWidget {
  const LoanDetailsPage({Key? key}) : super(key: key);

  @override
  _LoanDetailsPageState createState() => _LoanDetailsPageState();
}

class _LoanDetailsPageState extends State<LoanDetailsPage> {
  final TextEditingController _loanAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Loan Needed Amount'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('image1.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  cursorColor: Colors.purple,
                  style: TextStyle(color: Colors.purple),
                  controller: _loanAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Loan Amount',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double loanAmount = double.parse(_loanAmountController.text);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoanPaymentPage(loanAmount: loanAmount),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    fixedSize: Size(200, 50)
                ),
                child: const Text('Proceed'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loanAmountController.dispose();
    super.dispose();
  }
}