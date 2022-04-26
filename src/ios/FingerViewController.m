#import "FingerViewController.h"

@interface FingerViewController () {
    int saveCount;
}

@end

@implementation FingerViewController
@synthesize callbackId = _callbackId;


+ (instancetype)sharedHelper:(NSString *)callbackid {
    
    static FingerViewController *sharedClass = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClass = [[self alloc] init];
        sharedClass.callbackId = callbackid;
    });

    return sharedClass;
}


-(void)startConfig{
    VeridiumLicenseStatus *sdkStatus = [VeridiumSDK setup:@"yV8KKLqN+opTmyV/phKuTVAO/Fo7Pj4YrdpmCMU1ZWMB8W2ETucpSCqrfFLYFUMS5eT0ewS7+CBSqD9Ce94SA3siZGV2aWNlRmluZ2VycHJpbnQiOiJINzAxcndVaVRRM09NSDJLRWsva1N6MUhEVjIvNmwwVnVXVzRBUFNlVDRnPSIsImxpY2Vuc2UiOiIraE4rU0JIaWZWRGt0VU1sdHo3VHc0RURBZkZnUkhUOUpXODJvS2dtbkdPb0srQjhCK2I0SkNKajZ2T05Ld1lxTjV5MFlLaHgzZUhJeHRPV0VmVzdCbnNpZEhsd1pTSTZJbE5FU3lJc0ltNWhiV1VpT2lKVFJFc2lMQ0pzWVhOMFRXOWthV1pwWldRaU9qRTJNakE0TkRBME5UVXNJbU52YlhCaGJubE9ZVzFsSWpvaVNXNXpiMngxZEdsdmJuTWdSVzUwWld3aUxDSmpiMjUwWVdOMFNXNW1ieUk2SWpSR1JWWTBJR2xQVXk5QmJtUnliMmxrSUdOdmJTNWxiblJsYkM1dGIzWnBiQzVoZFhSdllXTjBhWFpoWTJsdmJpSXNJbU52Ym5SaFkzUkZiV0ZwYkNJNkltMXBaM1ZsYkM1b1pYSnVZVzVrWlhwQWFXNXpiMngxZEdsdmJuTXVjR1VpTENKemRXSk1hV05sYm5OcGJtZFFkV0pzYVdOTFpYa2lPaUlyT1V4NVF6QkJaRWx5WkZrcmMxWk1RbEV3WkRFMVkzaHpkSEJEZWxrdlJIZDVOVmxUYVZBclZHUlZQU0lzSW5OMFlYSjBSR0YwWlNJNk1UWXhPVFE1TmpBd01Dd2laWGh3YVhKaGRHbHZia1JoZEdVaU9qRTJOVEkyTnpNMk1EQXNJbWR5WVdObFJXNWtSR0YwWlNJNk1UWTFNamcwTmpRd01Dd2lkWE5wYm1kVFFVMU1WRzlyWlc0aU9tWmhiSE5sTENKMWMybHVaMFp5WldWU1FVUkpWVk1pT21aaGJITmxMQ0oxYzJsdVowRmpkR2wyWlVScGNtVmpkRzl5ZVNJNlptRnNjMlVzSW1KcGIyeHBZa1poWTJWRmVIQnZjblJGYm1GaWJHVmtJanBtWVd4elpTd2ljblZ1ZEdsdFpVVnVkbWx5YjI1dFpXNTBJanA3SW5ObGNuWmxjaUk2Wm1Gc2MyVXNJbVJsZG1salpWUnBaV1FpT21aaGJITmxmU3dpWlc1bWIzSmpaU0k2ZXlKd1lXTnJZV2RsVG1GdFpYTWlPbHNpWTI5dExtVnVkR1ZzTG0xdmRtbHNMbUYxZEc5aFkzUnBkbUZqYVc5dUlsMHNJbk5sY25abGNrTmxjblJJWVhOb1pYTWlPbHRkZlgwPSJ9"];

    if(!sdkStatus.initSuccess){
        return;
    }

    VeridiumLicenseStatus *status4F = [VeridiumSDK.sharedSDK setupLib4FWithLicense:@"vS2g1sDOr+mOXo2bz2A2YKkxgHIQ8orprWEKqZ8N7O5eFSzSKvO5Rp5y+6pFVgJBQXMBBBhXG207Oa2BIwmsDHsiZGV2aWNlRmluZ2VycHJpbnQiOiJINzAxcndVaVRRM09NSDJLRWsva1N6MUhEVjIvNmwwVnVXVzRBUFNlVDRnPSIsImxpY2Vuc2UiOiJrK1pWSFRScGRMUU9QMEl4K1I2ZGZ2dEtnUkkxdkZ4eDRtTzJwclM2bW41UlUzdlhybVlmOTh1YUxQd0pENXpLeXdCK2swU1hwNE1Xc2dkM1FmQjFBbnNpZEhsd1pTSTZJa0pKVDB4SlFsTWlMQ0p1WVcxbElqb2lORVlpTENKc1lYTjBUVzlrYVdacFpXUWlPakUyTVRrMk1qQTNOVEk0TkRrc0ltTnZiWEJoYm5sT1lXMWxJam9pU1c1emIyeDFkR2x2Ym5NZ1JXNTBaV3dpTENKamIyNTBZV04wU1c1bWJ5STZJalJHUlZZMUlHbFBVeTlCYm1SeWIybGtJR052YlM1bGJuUmxiQzV0YjNacGJDNWhkWFJ2WVdOMGFYWmhZMmx2YmlJc0ltTnZiblJoWTNSRmJXRnBiQ0k2SW0xcFozVmxiQzVvWlhKdVlXNWtaWHBBYVc1emIyeDFkR2x2Ym5NdWNHVWlMQ0p6ZFdKTWFXTmxibk5wYm1kUWRXSnNhV05MWlhraU9pSTJRakpoWTJKQk1FczJPRzlDUmxadmVFVnhjMFpZYmxwV2RIRkdVVmh0YWtGck5VSlZVMGxpY0ZaQlBTSXNJbk4wWVhKMFJHRjBaU0k2TVRZeE9UUTVOakF3TURBd01Dd2laWGh3YVhKaGRHbHZia1JoZEdVaU9qRTJOVEkyTnpNMk1EQXdNREFzSW1keVlXTmxSVzVrUkdGMFpTSTZNVFkxTWpnME5qUXdNREF3TUN3aWRYTnBibWRUUVUxTVZHOXJaVzRpT21aaGJITmxMQ0oxYzJsdVowWnlaV1ZTUVVSSlZWTWlPbVpoYkhObExDSjFjMmx1WjBGamRHbDJaVVJwY21WamRHOXllU0k2Wm1Gc2MyVXNJbUpwYjJ4cFlrWmhZMlZGZUhCdmNuUkZibUZpYkdWa0lqcG1ZV3h6WlN3aWNuVnVkR2x0WlVWdWRtbHliMjV0Wlc1MElqcDdJbk5sY25abGNpSTZabUZzYzJVc0ltUmxkbWxqWlZScFpXUWlPbVpoYkhObGZTd2labVZoZEhWeVpYTWlPbnNpWW1GelpTSTZkSEoxWlN3aWMzUmxjbVZ2VEdsMlpXNWxjM01pT25SeWRXVXNJbVY0Y0c5eWRDSTZkSEoxWlgwc0ltVnVabTl5WTJWa1VISmxabVZ5Wlc1alpYTWlPbnNpYldGdVpHRjBiM0o1VEdsMlpXNWxjM01pT21aaGJITmxmU3dpZG1WeWMybHZiaUk2SWpVdUtpSjkifQ=="];

    if(!status4F.initSuccess){
        return;
    }
    
    [VeridiumSDK.sharedSDK register4FUIEnroller];
    [VeridiumSDK.sharedSDK register4FUIExporter];
    [VeridiumSDK.sharedSDK register4FUIAuthenticator];
    
    return;
}



- (void)viewDidLoad {
    [super viewDidLoad];
}


NSInteger *fingerValue;
Boolean *livenessValue;

- (void)onExportFingerWithLeftCode:(NSInteger)leftCode andRightCode:(NSInteger)rightCode andLiveness:(Boolean)liveness {
    
    [self startConfig];
  
    if (rightCode == 0) {
          return;
    }
  
  	fingerValue = &rightCode;
    livenessValue = &liveness;
    
    [self initiateVeridium];
}



- (void) initiateVeridium {
    VeridiumFourFCaptureConfig *configVeridium = [[VeridiumFourFCaptureConfig alloc] init];
    NSMutableSet *fingers = [[NSMutableSet alloc] init];
    NSNumber *finger = [NSNumber numberWithInteger: *fingerValue];
    [fingers addObject:finger];
    
    [configVeridium setExportFormat:FORMAT_JSON];
    [configVeridium setFixed_print_width:(512)];
    [configVeridium setFixed_print_height:(512)];
    [configVeridium setWsq_compression_ratio:COMPRESS_5to1];
    [configVeridium setPack_wsq:YES];
    [configVeridium setPack_bmp:NO];
    [configVeridium setPack_raw:NO];
    [configVeridium setPack_png:NO];
    [configVeridium setUseLiveness:YES];
    [configVeridium setLiveness_factor:99];
    [configVeridium setActive_liveness_beta:*livenessValue];
    [configVeridium setTargetIndexFinger:NO];
    [configVeridium setTargetLittleFinger:NO];
    [configVeridium setPack_audit_image:YES];
    [configVeridium setCalculate_nfiq:YES];
    [configVeridium setNist_type:Nist_type_T14_9];
    [configVeridium setFingers:fingers];
    [configVeridium setCanSwitch:NO];
    [configVeridium setDo_debug:NO];
    configVeridium.do_export = YES;
    
    [configVeridium configureTimeoutEnabled:YES withTimeoutCanRestart:YES andTimoutSeconds:60 andAllowedRetries:infinite];
    
    [VeridiumBiometricsFourFService exportTemplate:configVeridium onSuccess:^(NSData * _Nonnull data) {
        NSError *e = nil;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &e];
        
        NSArray *fingerPrints = [json valueForKey: @"Fingerprints"];
        NSDictionary *wsq = [[[fingerPrints objectAtIndex:0] valueForKey:@"FingerImpressionImage"] valueForKey:@"BinaryBase64ObjectWSQ"];
        
        NSDictionary *auditImage = [json valueForKey: @"AuditImage_0"];
        NSDictionary *img = [auditImage valueForKey:@"BinaryBase64ObjectJPG"];
        
        NSMutableDictionary * dict = [NSMutableDictionary new];
                                    [dict setObject:wsq forKey:@"wsq"];
                                    [dict setObject:img forKey:@"img"];

        [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:dict callbackId:self.callbackId];
        
    } onFail:^{
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"FAIL" callbackId:self.callbackId];
    } onCancel:^{
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"CANCEL" callbackId:self.callbackId];
    } onError:^(NSError * _Nonnull error) {
      [EntelFingerPlugin.entelFingerPlugin sendResponseFingerDict:@"ERROR" callbackId:self.callbackId];
    }];
}

@end

