#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>


@interface VIOAppearanceSettings : HBAppearanceSettings
@end

@implementation VIOAppearanceSettings

- (UIColor *)tintColor { return [UIColor colorWithRed: 0.96 green: 0.76 blue: 0.81 alpha: 1.00]; }
- (UIColor *)statusBarTintColor { return [UIColor whiteColor]; }
- (UIColor *)navigationBarTitleColor { return [UIColor whiteColor]; }
- (UIColor *)navigationBarTintColor { return [UIColor whiteColor]; }
- (UIColor *)tableViewCellSeparatorColor { return [UIColor colorWithWhite:0 alpha:0]; }
- (UIColor *)navigationBarBackgroundColor { return [UIColor colorWithRed: 0.96 green: 0.76 blue: 0.81 alpha: 1.00]; }
- (BOOL)translucentNavigationBar { return YES; }

@end


@interface VIORootListController : PSListController

@property(nonatomic, retain)VIOAppearanceSettings* appearanceSettings;
@property(nonatomic, retain)HBPreferences* preferences;
@property(nonatomic, retain)UISwitch* enableSwitch;
@property(nonatomic, retain)UIBarButtonItem* item;
@property(nonatomic, retain)UIView* headerView;
@property(nonatomic, retain)UIImageView* headerImageView;
@property(nonatomic, retain)UIImageView * violetImage;
@property(nonatomic, retain)UILabel* titleLabel;
@property(nonatomic, retain)UIImageView* iconView;
@property(nonatomic, retain)UIBlurEffect* blur;
@property(nonatomic, retain)UIVisualEffectView* blurView;

-(void)setEnabled;

@end
