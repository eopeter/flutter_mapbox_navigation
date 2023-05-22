/// This class contains rating and comment from the user when navigation ends on iOS
class MapBoxFeedback {
  int? rating;
  String? comment;

  MapBoxFeedback({this.rating, this.comment});

  MapBoxFeedback.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
  }
}
