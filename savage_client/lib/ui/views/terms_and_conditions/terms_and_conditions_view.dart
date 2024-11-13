import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:savage_client/ui/common/ui_helpers.dart';
import 'package:savage_client/ui/widgets/common/loader/loader.dart';
import 'package:stacked/stacked.dart';

import 'terms_and_conditions_viewmodel.dart';

class TermsAndConditionsView extends StackedView<TermsAndConditionsViewModel> {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TermsAndConditionsViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return const Scaffold(body: Loader());
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Savage Coworking Terms & Conditions',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: viewModel.acceptTerms,
              icon: const Icon(Icons.check),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (viewModel.hasError) ...[
                Text(
                  viewModel.modelError,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.red),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'version: ${viewModel.version}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              MarkdownBody(data: viewModel.termsAndConditions),
              verticalSpaceMedium,
              ElevatedButton(
                onPressed: viewModel.acceptTerms,
                child: const Text('Accept'),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(TermsAndConditionsViewModel viewModel) async {
    await viewModel.getData();
  }

  @override
  TermsAndConditionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TermsAndConditionsViewModel();
}
