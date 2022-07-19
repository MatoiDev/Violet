#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>

@interface VIOPBAppearance : HBAppearanceSettings
@end

@interface VIOVioletOnSiriListController : HBListController

@property(nonatomic, retain)UIBlurEffect * blurEffect;
@property(nonatomic, retain)UIVisualEffectView * preferenceBundleSiriSectionBlur;
@property(nonatomic, retain)VIOPBAppearance * appearanceSettings;

- (void)thanksAlexa;

@end