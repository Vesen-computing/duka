import 'package:flutter/material.dart';
import 'package:savey/presentations/widgets/payment_checkbox_row.dart';
import 'package:savey/presentations/widgets/payment_text_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key, required this.arguments}) : super(key: key);
  final Map<String, dynamic> arguments;

  @override
  Widget build(BuildContext context) {
    String title = arguments["title"];
    String page = arguments["page"];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Service Provider',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const CheckBoxRow(),
              const SizedBox(height: 30),
              const PaymentTextWidget(hintText: 'Sender account number'),
              const SizedBox(height: 16),
              const PaymentTextWidget(hintText: 'Receiver account number'),
              const SizedBox(height: 16),
              if (page.toLowerCase() == 'airtime') const SizedBox(height: 16),
              const PaymentTextWidget(hintText: 'Receiver phone number'),
              SizedBox(height: size.height * .15),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(size.width, 50)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text('PAY ${page.toUpperCase()}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
