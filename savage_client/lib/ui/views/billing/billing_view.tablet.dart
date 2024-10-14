import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'billing_viewmodel.dart';

class BillingViewTablet extends ViewModelWidget<BillingViewModel> {
  const BillingViewTablet({super.key});

  @override
  Widget build(BuildContext context, BillingViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
