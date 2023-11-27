import 'package:flutter/material.dart';
import 'loan_details_page.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Loan Request System'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image3.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoanDetailsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  fixedSize: Size(200, 50)
              ),
              child: const Text('Take a Loan',
                style: TextStyle(fontSize: 20),),

            ),
          ),
        )
    );
  }
}
