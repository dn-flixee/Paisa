import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../main.dart';
import '../../core/common.dart';
import '../../core/enum/box_types.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    Key? key,
    required this.pickImage,
    this.maxRadius,
    this.useDefault = false,
  }) : super(key: key);

  final VoidCallback pickImage;
  final double? maxRadius;
  final bool useDefault;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: getIt
          .get<Box<dynamic>>(instanceName: BoxType.settings.name)
          .listenable(
        keys: [userImageKey],
      ),
      builder: (context, value, _) {
        String image = value.get(userImageKey, defaultValue: '');
        if (image == 'no-image') {
          image = '';
        }
        return GestureDetector(
          onTap: pickImage,
          child: Builder(
            builder: (context) {
              if (image.isEmpty) {
                return CircleAvatar(
                  backgroundColor: context.primary,
                  maxRadius: maxRadius,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: context.onPrimary,
                  ),
                );
              } else {
                if (useDefault) {
                  return CircleAvatar(
                    foregroundImage: FileImage(File(image)),
                    maxRadius: maxRadius,
                  );
                } else {
                  return Badge(
                    alignment: AlignmentDirectional.bottomEnd,
                    label: GestureDetector(
                      onTap: () {
                        value.put(userImageKey, '');
                      },
                      child: Center(
                        child: Icon(
                          MdiIcons.delete,
                          size: 8,
                          color: context.onPrimary,
                        ),
                      ),
                    ),
                    backgroundColor: context.primary,
                    child: CircleAvatar(
                      foregroundImage: FileImage(File(image)),
                      maxRadius: maxRadius,
                    ),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
