part of navigation;

/// Callback method for when the navigation view is ready to be used.
///
/// Pass to [MapBoxNavigationView.onMapCreated] to receive a [MapBoxNavigationViewController] when the
/// map is created.
typedef void OnNavigationViewCreatedCallBack(
    MapBoxNavigationViewController controller);

///Embeddable Navigation View.
class MapBoxNavigationView extends StatelessWidget {
  static const StandardMessageCodec _decoder = StandardMessageCodec();
  final OnNavigationViewCreatedCallBack onCreated;
  final ValueSetter<RouteEvent> onRouteEvent;

  MapBoxNavigationView({Key key, this.onCreated, this.onRouteEvent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = {"someInit": "initData"};

    if (Platform.isAndroid) {
      return AndroidView(
          viewType: 'FlutterMapboxNavigationView',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: args,
          creationParamsCodec: _decoder);
    } else if (Platform.isIOS) {
      return UiKitView(
          viewType: 'FlutterMapboxNavigationView',
          onPlatformViewCreated: _onPlatformViewCreated,
          creationParams: args,
          creationParamsCodec: _decoder);
    } else
      return Container();
  }

  void _onPlatformViewCreated(int id) {
    if (onCreated == null) {
      return;
    }
    onCreated(MapBoxNavigationViewController(id, onRouteEvent));
  }
}
