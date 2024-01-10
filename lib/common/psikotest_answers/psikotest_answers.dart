import 'dart:math';

import 'package:cat_akademik_kepolisian/domain/entities/questions/option_entity.dart';

class QuestionLocalAnswers {
  static List<OptionEntity> get positive => [
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Sangat Setuju',
          value: '5',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Setuju',
          value: '4',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Netral',
          value: '3',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Tidak Setuju',
          value: '2',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Sangat Tidak Setuju',
          value: '1',
        ),
      ];
  static List<OptionEntity> get negative => [
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Sangat Setuju',
          value: '1',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Setuju',
          value: '2',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Netral',
          value: '3',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Tidak Setuju',
          value: '4',
        ),
        OptionEntity(
          id: Random().nextInt(200).toString(),
          name: 'Sangat Tidak Setuju',
          value: '5',
        ),
      ];
}
