#ifndef FLUTTER_PLUGIN_FLUTTER_MAPBOX_NAVIGATION_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAPBOX_NAVIGATION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_mapbox_navigation {

class FlutterMapboxNavigationPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMapboxNavigationPlugin();

  virtual ~FlutterMapboxNavigationPlugin();

  // Disallow copy and assign.
  FlutterMapboxNavigationPlugin(const FlutterMapboxNavigationPlugin&) = delete;
  FlutterMapboxNavigationPlugin& operator=(const FlutterMapboxNavigationPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_mapbox_navigation

#endif  // FLUTTER_PLUGIN_FLUTTER_MAPBOX_NAVIGATION_PLUGIN_H_
