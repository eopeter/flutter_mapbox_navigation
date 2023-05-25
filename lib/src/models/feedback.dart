/// This class contains rating and comment from the user when
/// navigation ends on iOS
class MapBoxFeedback {
  /// Constructor
  MapBoxFeedback({this.rating, this.comment});

  /// return [MapBoxFeedback] from a json
  MapBoxFeedback.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] != null ? json['rating'] as int : null;
    comment = json['comment'] != null ? json['comment'] as String : null;
  }

  /// Rating 0-100 corresponding to the stars selection in iOS feedback
  int? rating;

  /// String comment
  String? comment;
}
