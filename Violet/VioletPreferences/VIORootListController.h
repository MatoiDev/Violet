#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>

@interface VIOPBAppearance : HBAppearanceSettings
@end

@interface VIORootListController : PSListController

@property(nonatomic, retain)VIOPBAppearance* appearanceSettings;
@property(nonatomic, retain)HBPreferences* preferences;

@property(nonatomic, retain)NSTimer * titleTimer;

@property(nonatomic, retain)UISwitch* enableVioletSwitch;

@property(nonatomic, retain)UIBarButtonItem* barItem;

@property(nonatomic, retain)UIView* PBHeaderView;

@property(nonatomic, retain)UIImageView* PBHeaderImageView;
@property(nonatomic, retain)UIImageView * violetImage;

@property(nonatomic, retain)UILabel* VioletLabel;
@property(nonatomic, retain)UILabel* VioletVersionLabel;

@property(nonatomic, retain)UIBlurEffect* blurEffect;
@property(nonatomic, retain)UIVisualEffectView* blurOnPBScreen;

@property (nonatomic, retain)NSString * violetVersion;

- (void)setEnabled;
- (void)doRespring;
- (void)justaRespring;
- (void)setUpEnabledSwitch;

- (void)goVK;
- (void)goGH;
- (void)goTG;

@end
