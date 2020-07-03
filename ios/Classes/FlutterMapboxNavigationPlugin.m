#import "FlutterMapboxNavigationPlugin.h"
#if __has_include(<flutter_mapbox_navigation/flutter_mapbox_navigation-Swift.h>)
#import <flutter_mapbox_navigation/flutter_mapbox_navigation-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_mapbox_navigation-Swift.h"
#endif

@implementation FlutterMapboxNavigationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMapboxNavigationPlugin registerWithRegistrar:registrar];
}
@end
