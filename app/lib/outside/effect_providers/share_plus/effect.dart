import 'package:share_plus/share_plus.dart';

import '../../../shared/mixins/logging.dart';

class Share_Effect with SharedMixin_Logging {
  const Share_Effect();

  Future<ShareResult> shareText(String text, {String? subject}) {
    return Share.share(text, subject: subject);
  }

  void shareUrl(String url, {String? text}) {
    Share.share(url, subject: text);
  }

  void shareImage(String imagePath, {String? text}) {
    Share.shareXFiles([XFile(imagePath)], text: text);
  }
}
