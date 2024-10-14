import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'billing_viewmodel.dart';

class BillingViewMobile extends ViewModelWidget<BillingViewModel> {
  const BillingViewMobile({super.key});

  @override
  Widget build(BuildContext context, BillingViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
