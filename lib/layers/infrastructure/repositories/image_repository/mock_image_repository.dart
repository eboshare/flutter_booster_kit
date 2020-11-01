import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_booster_kit/layers/domain/repositories/i_image_repository.dart';

@Singleton(as: IImageRepository, env: [Environment.test])
class MockImageRepository extends Mock implements IImageRepository {}
