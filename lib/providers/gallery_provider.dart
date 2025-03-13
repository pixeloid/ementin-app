import 'package:ementin_flutter/data/repository/insta_repository.dart';
import 'package:ementin_flutter/models/instagram_feed.dart';
import 'package:ementin_flutter/utils/other/notifier_safety.dart';

import '../services/locator.dart';

class GalleryProvider extends ChangeNotifierSafety {
  late List<InstagramFeed> feed = [];
  bool isLoading = false;

  InstaRepository instaRepository = getIt.get<InstaRepository>();

  Future getFeed(url) async {
    isLoading = true;
    instaRepository.getFeed(url).then((data) {
      isLoading = false;
      feed = data;
      notifyListeners();
      return feed;
      // ignore: body_might_complete_normally_catch_error
    }).catchError((error) {
      isLoading = false;
      notifyListeners();
    });
  }

  @override
  void resetState() {
    feed = [];
  }
}
