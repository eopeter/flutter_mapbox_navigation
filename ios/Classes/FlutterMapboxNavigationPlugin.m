#import "FlutterMapboxNavigationPlugin.h"
#import <flutter_mapbox_navigation/flutter_mapbox_navigation-Swift.h>

@implementation FlutterMapboxNavigationPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMapboxNavigationPlugin registerWithRegistrar:registrar];
}
@end
