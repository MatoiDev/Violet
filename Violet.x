#import <Violet.h>

%group VioletOnSiri

%hook SUICOrbView

- (id)initWithFrame:(CGRect)arg1 { // remove siris's Orb

    if (hideOrb){
        return %orig(CGRectMake(0, 0, 0, 0));
    }

    return %orig;
}

%end


// thanks Alexa
%hook SiriUIBackgroundBlurViewController

- (void)viewDidLoad {
    %orig;

    if ([blurOnSiriAmountValue doubleValue] != 0) {

        if (!blurEffect) {
            blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        }

        if (!onSiriBlur) {
            onSiriBlur = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        }

        [onSiriBlur setFrame: [[self view] bounds]];
        [onSiriBlur setAlpha: [blurOnSiriAmountValue doubleValue]];
        [onSiriBlur setClipsToBounds: YES];
        [onSiriBlur setOpaque: false];
        [onSiriBlur setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

        if (![onSiriBlur isDescendantOfView:[self view]]) {
            [[self view] addSubview:onSiriBlur];
        }

    }

    violetOnSiriWhenAppearImage = [[UIImageView alloc] initWithFrame: [[self view] frame]];

    [self.view addSubview:violetOnSiriWhenAppearImage];
    [violetOnSiriWhenAppearImage setContentMode:UIViewContentModeScaleAspectFit];
    [violetOnSiriWhenAppearImage setClipsToBounds:YES];

    violetOnSiriWhenAppearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/siriAppears.png"];

    violetOnSiriWhenAppearImage.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

        [violetOnSiriWhenAppearImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
        [violetOnSiriWhenAppearImage.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
        [violetOnSiriWhenAppearImage.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
        [violetOnSiriWhenAppearImage.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]

    ]];

    violetOnSiriWhenDisappearImage = [[UIImageView alloc] initWithFrame: [[self view] frame]];

    [self.view addSubview:violetOnSiriWhenDisappearImage];
    [violetOnSiriWhenDisappearImage setContentMode:UIViewContentModeScaleAspectFit];
    [violetOnSiriWhenDisappearImage setClipsToBounds:YES];

    violetOnSiriWhenDisappearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/siriDisappears.png"];

    violetOnSiriWhenDisappearImage.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

        [violetOnSiriWhenDisappearImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
        [violetOnSiriWhenDisappearImage.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
        [violetOnSiriWhenDisappearImage.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
        [violetOnSiriWhenDisappearImage.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]

    ]];

    [violetOnSiriWhenDisappearImage setAlpha:0];
    [violetOnSiriWhenAppearImage setAlpha:0];

}

- (void)viewWillAppear:(BOOL)animated {
    %orig;

    [onSiriBlur setAlpha: [blurOnSiriAmountValue doubleValue]];
    [violetOnSiriWhenAppearImage setAlpha:0];

    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [violetOnSiriWhenAppearImage setAlpha:1];
    } completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [violetOnSiriWhenDisappearImage setAlpha: 1];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [violetOnSiriWhenDisappearImage setAlpha: 0];
        });
});

}

%end

%hook SiriPresentationViewController

- (void)viewWillDisappear:(BOOL)animated {

    %orig;

    [violetOnSiriWhenDisappearImage setAlpha:1];
    [violetOnSiriWhenAppearImage setAlpha:0];

    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [violetOnSiriWhenDisappearImage setAlpha:0];
        [onSiriBlur setAlpha: 0];
    } completion:nil];

}

%end

%end

%group VioletOnSpringBoard

%hook SBHomeScreenViewController

- (void)viewDidLoad {

    %orig;

    if ([blurOnSBAmountValue doubleValue] != 0) {

        if (!blurEffect) {
            blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        }

        if (!onSBoardBlur) {
            onSBoardBlur = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        }

        [onSBoardBlur setFrame: [[self view] bounds]];
        [onSBoardBlur setAlpha: [blurOnSBAmountValue doubleValue]];
        [onSBoardBlur setClipsToBounds: YES];
        [onSBoardBlur setOpaque: false];
        [onSBoardBlur setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

        if (![onSBoardBlur isDescendantOfView:[self view]]) {
            [[self view] addSubview:onSBoardBlur];
        }

    }

    waitingForLord = [[UIImageView alloc] initWithFrame: [[self view] frame]];

    [self.view addSubview:waitingForLord];
    [waitingForLord setContentMode:UIViewContentModeScaleAspectFit];
    [waitingForLord setClipsToBounds:YES];

    waitingForLord.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/waitingForLord.png"];

    waitingForLord.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[

        [waitingForLord.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
        [waitingForLord.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
        [waitingForLord.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
        [waitingForLord.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]

    ]];

    helloMaster = [[UIImageView alloc] initWithFrame: [[self view] frame]];

    [self.view addSubview:helloMaster];
    [helloMaster setContentMode:UIViewContentModeScaleAspectFit];
    [helloMaster setClipsToBounds:YES];

    helloMaster.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/helloMyLord.png"];

    helloMaster.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

        [helloMaster.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
        [helloMaster.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
        [helloMaster.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
        [helloMaster.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]

    ]];

    [helloMaster setAlpha: 0];

}

%end

%hook SBLockScreenManager

- (void)lockUIFromSource:(int)arg1 withOptions:(id)arg2 {

    %orig;

    [helloMaster setAlpha:0];
    [waitingForLord setAlpha:1];

}


// Срабатывает когда локскрин убирается уже у активированного устройства

//-(void)lockScreenViewControllerDidDismiss {
//[UIView animateWithDuration:30 animations:^{
//[helloMaster setAlpha:0];
//}];
//}

%end

%hook CSCoverSheetViewController

- (void)viewWillDisappear:(BOOL)animated {

    %orig;

    [onSBoardBlur setAlpha: [blurOnSBAmountValue doubleValue]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [UIView animateWithDuration:0.4 delay:0 options: UIViewAnimationOptionCurveEaseIn animations:^{
            [helloMaster setAlpha: 1];
        } completion: ^(BOOL finished){
            [waitingForLord setAlpha: 0];
        }];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                [helloMaster setAlpha:0];
                [onSBoardBlur setAlpha: 0];
            }];
        });
    });

}

%end

%end

%ctor {

    //alloc preferences
    preferences = [[HBPreferences alloc] initWithIdentifier:@"com.appleworm.violetprefrences"];
    // set enabled bool for Violet
    [preferences registerBool: &enabledViolet default: YES forKey:@"Enabled"];
    if (!enabledViolet) { return ; }

    // Violet on SpringBoard
    [preferences registerBool: &showOnSB default: YES forKey: @"ShowOnSB"];
    if (showOnSB) {
        [preferences registerObject: &blurOnSBAmountValue default: @"0.5" forKey: @"OnSBBlur"];
    }

    // Violet on Siri
    [preferences registerBool: &showOnSiri default: YES forKey: @"ShowOnSiri"];
    if (showOnSiri) {
        [preferences registerObject: &blurOnSiriAmountValue default: @"0.5" forKey: @"OnSiriBlur"];
        [preferences registerBool: &hideOrb default: YES forKey: @"HideOrb"];
    }

    if (showOnSB) {
        %init(VioletOnSpringBoard);
    }

    if (showOnSiri) {
        %init(VioletOnSiri);
    }

}
