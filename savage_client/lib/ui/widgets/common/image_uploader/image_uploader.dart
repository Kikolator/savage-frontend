import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import 'image_uploader_model.dart';

class ImageUploader extends StackedView<ImageUploaderModel> {
  final bool buttonActive;
  final String? imageUrl;
  final XFile? imageFile;
  final double size;
  final void Function(XFile file)? onImageSelected;

  const ImageUploader({
    this.buttonActive = true,
    this.imageUrl,
    this.imageFile,
    this.size = 100,
    this.onImageSelected,
    super.key,
  });

  Widget _imageBuilder(
      BuildContext context, String? imageUrl, XFile? imageFile) {
    if (imageFile != null) {
      if (kIsWeb) {
        return Image.network(
          imageFile.path,
          fit: BoxFit.cover,
        );
      } else {
        return Image.file(
          File(imageFile.path),
          fit: BoxFit.cover,
        );
      }
    } else if (imageUrl != null) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
      );
    } else {
      return const Icon(
        Icons.person,
        size: 50,
      );
    }
  }

  @override
  Widget builder(
    BuildContext context,
    ImageUploaderModel viewModel,
    Widget? child,
  ) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: EdgeInsets.all(size / 9),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: buttonActive ? viewModel.selectImageFile : null,
            child: Container(
              height: size,
              width: size,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: _imageBuilder(
                  context, viewModel.imageUrl, viewModel.imageFile),
            ),
          ),
        ),
        if (buttonActive) ...[
          IconButton(
            onPressed: viewModel.selectImageFile,
            iconSize: size / 5,
            icon: Container(
              height: size / 3,
              width: size / 3,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_a_photo,
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  ImageUploaderModel viewModelBuilder(
    BuildContext context,
  ) =>
      ImageUploaderModel(imageUrl, imageFile, onImageSelected);
}
