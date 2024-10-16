import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'invoices_viewmodel.dart';

class InvoicesViewDesktop extends ViewModelWidget<InvoicesViewModel> {
  const InvoicesViewDesktop({super.key});

  @override
  Widget build(BuildContext context, InvoicesViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
