import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_notifier_provider_task/services.dart';

import 'api.dart';

final dataNotifierProvider =
    StateNotifierProvider<PostsNotifier, List<Posts>>((ref) => PostsNotifier());
