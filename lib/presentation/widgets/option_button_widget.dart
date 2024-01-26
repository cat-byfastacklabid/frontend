import 'dart:convert';

import 'package:cat_akademik_kepolisian/domain/entities/questions/option_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:flutter/material.dart';

class OptionButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final OptionEntity option;

  const OptionButtonWidget({
    super.key,
    this.onTap,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    print(option.isImageOptions);
    print(option.name);
    return Container(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 15,
                width: 15,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  border: Border.all(),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: option.isSelected ? Colors.green : null,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: option.isImageOptions
                    ? Image.memory(
                        base64Decode(option.name),
                        height: 30,
                        fit: BoxFit.cover,
                      )
                    : Text(
                        option.name,
                        style: TextStyle(
                          fontSize: context.verticalView ? 12 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
