#import "PluginDemoPlugin.h"
#import <plugin_demo/plugin_demo-Swift.h>

@implementation PluginDemoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginDemoPlugin registerWithRegistrar:registrar];
}
@end
