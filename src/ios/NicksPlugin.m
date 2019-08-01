#import "NicksPlugin.h"

#import <Cordova/CDVAvailability.h>

@implementation NGNicksPlugin

- (void)pluginInitialize {
  NSLog(@"initialized plugin NGNicksPlugin...");
}

- (void)echo:(CDVInvokedUrlCommand *)command {
    NSString* phrase = [command.arguments objectAtIndex:0];
    [self.commandDelegate sendPluginResult:phrase callbackId:command.callbackId];
}

- (void)getDate:(CDVInvokedUrlCommand *)command {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [dateFormatter setLocale:enUSPOSIXLocale];
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

  NSDate *now = [NSDate date];
  NSString *iso8601String = [dateFormatter stringFromDate:now];

  CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
  [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
