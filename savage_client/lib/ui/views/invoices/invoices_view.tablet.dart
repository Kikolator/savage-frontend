import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'invoices_viewmodel.dart';

class InvoicesViewTablet extends ViewModelWidget<InvoicesViewModel> {
  const InvoicesViewTablet({super.key});

  @override
  Widget build(BuildContext context, InvoicesViewModel viewModel) {
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
