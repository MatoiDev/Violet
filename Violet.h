#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "GcUniversal/GcImagePickerUtils.h"


@interface SBHomeScreenViewController : UIViewController
@end

@interface CSCoverSheetViewController : UIViewController
@end

@interface SiriUIBackgroundBlurViewController : UIViewController
@end

@interface AFUISiriViewController : UIViewController
@end

@interface SUICOrbView : UIView
@end

UIImageView * waitingForLord = nil;
UIImageView * helloMaster = nil;
UIImageView * violetOnSiriWhenAppearImage;
UIImageView * violetOnSiriWhenDisappearImage;

UIVisualEffectView * onSiriBlur = nil;
UIVisualEffectView * onSBoardBlur = nil;

UIBlurEffect * blurEffectOnSiri = nil;
UIBlurEffect * blurEffectOnSB = nil;

UIImage *customImage = nil;
UIImage *customImageOnUnlock = nil;

// HBPreferences constants
HBPreferences* preferences = nil;

BOOL enabledViolet = NO;

BOOL showOnSB = NO;
BOOL showOnSiri = NO;
BOOL useCustomImage = NO;
BOOL useCustomImageOnUnlock = NO;
BOOL hideOrb = NO;
BOOL fillOnSB = NO;

BOOL _isUILocked = YES;

NSString * blurOnSBAmountValue = @"0.5";
NSString * blurOnSiriAmountValue = @"0.5";

NSString * xPosOnSB = @"0";
NSString * yPosOnSB = @"0";

NSString * xPosOnSiri = @"0";
NSString * yPosOnSiri = @"0";

NSString * blurEffectStyleOnSiri = @"0";
NSString * blurEffectStyleOnSB = @"0";
