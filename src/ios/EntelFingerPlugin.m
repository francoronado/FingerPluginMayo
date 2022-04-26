#import "EntelFingerPlugin.h"

@implementation EntelFingerPlugin

@synthesize responseCallbackId = _responseCallbackId;

EntelFingerPlugin* entelFingerPlugin;

+ (EntelFingerPlugin *) entelFingerPlugin {
    return entelFingerPlugin;
}

- (void)pluginInitialize {
    entelFingerPlugin = self;
}

- (void)getwsq:(CDVInvokedUrlCommand*)command{
    NSDictionary* args = [command.arguments objectAtIndex:0];
    
    int leftFingerCode = [[args objectForKey:@"leftFingerCode"] intValue];
    int rightFingerCode = [[args objectForKey:@"righFingerCode"] intValue];
    bool liveness = [[args objectForKey:@"liveness"] boolValue];
    
    self.responseCallbackId = command.callbackId;
    if (self.responseCallbackId != nil) {
        //Logic FingerViewController
        FingerViewController *fvc = [FingerViewController sharedHelper:self.responseCallbackId];
      
        fvc.leftCodeFinger = leftFingerCode;
        fvc.rightCodeFinger = rightFingerCode;
        fvc.liveness = liveness;
        [fvc onExportFingerWithLeftCode:leftFingerCode andRightCode:rightFingerCode andLiveness:liveness];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
        [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    } else {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)sendResponseFinger:(NSString *)responseText callbackId:(NSString *)callbackId{
    if (callbackId != nil) {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:responseText];
        [pluginResult setKeepCallbackAsBool:NO];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.responseCallbackId];
    }
}

- (void)sendResponseFingerDict:(NSDictionary *)responseDict callbackId:(NSString *)callbackId{
    if (callbackId != nil) {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseDict];
        [pluginResult setKeepCallbackAsBool:NO];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.responseCallbackId];
    }
}

@end

