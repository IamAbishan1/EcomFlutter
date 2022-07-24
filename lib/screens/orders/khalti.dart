import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalti/khalti.dart';

import '../../widgets/custom_textform.dart';
import '../../widgets/snackbar.dart';

class KhaltiPayment extends StatefulWidget {
  const KhaltiPayment({Key? key}) : super(key: key);

  @override
  _KhaltiPaymentState createState() => _KhaltiPaymentState();
}

class _KhaltiPaymentState extends State<KhaltiPayment> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff27453D),
        appBar: AppBar(title: const Text('Payment')),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/image/khalti.png'),
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Phone Number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                hint: 'Pin Code',
                obscureText: true,
                controller: pinCodeController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (phoneController.text.isEmpty) {
                    CustomSnackbar.showSnackbar(context,
                        'Phone Number required', Colors.red, Colors.white);
                    return;
                  }
                  if (pinCodeController.text.isEmpty) {
                    CustomSnackbar.showSnackbar(
                        context, 'Pin Code required', Colors.red, Colors.white);
                    return;
                  }
                  final initiationModel = await Khalti.service.initiatePayment(
                    request: PaymentInitiationRequestModel(
                      amount: 1000,
                      mobile: phoneController.text,
                      productIdentity: 'pID',
                      productName: 'Product Name',
                      transactionPin: pinCodeController.text,
                      productUrl: '',
                      additionalData: {},
                    ),
                  );

                  final otp = await showDialog(
                      context: (context),
                      barrierDismissible: false,
                      builder: (context) {
                        String? _opt;
                        return AlertDialog(
                          title: const Text('Enter OTP'),
                          content: TextField(
                            onChanged: (v) => _opt = v,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              label: Text('OTP'),
                            ),
                          ),
                          actions: [
                            SimpleDialogOption(
                                child: const Text('Submit'),
                                onPressed: () {
                                  Navigator.pop(context, _opt);
                                })
                          ],
                        );
                      });

                  if (otp != null) {
                    try {
                      final model = await Khalti.service.confirmPayment(
                        request: PaymentConfirmationRequestModel(
                          confirmationCode: otp,
                          token: initiationModel.token,
                          transactionPin: pinCodeController.text,
                        ),
                      );

                      Navigator.pop(context, model.token);
                    } catch (e) {
                      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                child: const Text('Make Payment'),
              ),
            ],
          ),
        ));
  }
}

