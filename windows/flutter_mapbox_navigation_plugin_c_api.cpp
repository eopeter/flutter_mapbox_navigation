#include "include/flutter_mapbox_navigation/flutter_mapbox_navigation_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_mapbox_navigation_plugin.h"

void FlutterMapboxNavigationPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_mapbox_navigation::FlutterMapboxNavigationPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
