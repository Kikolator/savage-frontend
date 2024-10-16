import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'invoices_viewmodel.dart';

class InvoicesViewMobile extends ViewModelWidget<InvoicesViewModel> {
  const InvoicesViewMobile({super.key});

  @override
  Widget build(BuildContext context, InvoicesViewModel viewModel) {
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
