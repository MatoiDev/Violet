#import <Violet.h>

%group VioletOnSiri

%hook SUICOrbView

- (id)initWithFrame:(CGRect)arg1 {

    if (hideOrb){
        return %orig(CGRectMake(0, 0, 0, 0));
    }

    return %orig;
}

%end

%hook SiriUIBackgroundBlurViewController

- (void)viewDidLoad {
    %orig;

    if ([blurOnSiriAmountValue doubleValue] != 0) {

        if (!blurEffectOnSiri) {

            // Adaptable Styles

            if ([blurEffectStyleOnSiri intValue] == 0) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
            } else if ([blurEffectStyleOnSiri intValue] == 1) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial];
            } else if ([blurEffectStyleOnSiri intValue] == 2) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
            } else if ([blurEffectStyleOnSiri intValue] == 3) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterial];
            } else if ([blurEffectStyleOnSiri intValue] == 4) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterial];

            // Light Styles

            } else if ([blurEffectStyleOnSiri intValue] == 5) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialLight];
            } else if ([blurEffectStyleOnSiri intValue] == 6) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialLight];
            } else if ([blurEffectStyleOnSiri intValue] == 7) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialLight];
            } else if ([blurEffectStyleOnSiri intValue] == 8) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterialLight];
            } else if ([blurEffectStyleOnSiri intValue] == 9) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialLight];

            // Dark Styles

            } else if ([blurEffectStyleOnSiri intValue] == 10) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialDark];
            } else if ([blurEffectStyleOnSiri intValue] == 11) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialDark];
            } else if ([blurEffectStyleOnSiri intValue] == 12) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark];
            } else if ([blurEffectStyleOnSiri intValue] == 13) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterialDark];
            } else if ([blurEffectStyleOnSiri intValue] == 14) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];

            // Additional Styles

            } else if ([blurEffectStyleOnSiri intValue] == 15) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
            } else if ([blurEffectStyleOnSiri intValue] == 16) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            } else if ([blurEffectStyleOnSiri intValue] == 17) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            } else if ([blurEffectStyleOnSiri intValue] == 18) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
            } else if ([blurEffectStyleOnSiri intValue] == 19) {
                blurEffectOnSiri = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
            }
        }

        if (!onSiriBlur) {
            onSiriBlur = [[UIVisualEffectView alloc] initWithEffect:blurEffectOnSiri];
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

    // BOOL isCustomImage = [GcImagePickerUtils isImageInDefaults:@"com.appleworm.violetprefrences" withKey:@"CustomImage"];
    // customImage = [GcImagePickerUtils imageFromDefaults:@"com.appleworm.violetprefrences" withKey:@"CustomImage"];

    if (useCustomImage) {
        customImage = [GcImagePickerUtils imageFromDefaults:@"com.appleworm.violetprefrences" withKey:@"CustomImage"];
        violetOnSiriWhenAppearImage.image = customImage;
    } else {
        violetOnSiriWhenAppearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/siriAppears.png"];
    }

    violetOnSiriWhenAppearImage.translatesAutoresizingMaskIntoConstraints = NO;
    if (useCustomImage) {
        [NSLayoutConstraint activateConstraints:@[

            [violetOnSiriWhenAppearImage.widthAnchor constraintEqualToConstant:self.view.bounds.size.width],
            [violetOnSiriWhenAppearImage.heightAnchor constraintEqualToConstant:self.view.bounds.size.height],
            [violetOnSiriWhenAppearImage.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:[xPosOnSiri doubleValue]],
            [violetOnSiriWhenAppearImage.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:[yPosOnSiri doubleValue]]

        ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[

            [violetOnSiriWhenAppearImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
            [violetOnSiriWhenAppearImage.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
            [violetOnSiriWhenAppearImage.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
            [violetOnSiriWhenAppearImage.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]

        ]];
    }


    violetOnSiriWhenDisappearImage = [[UIImageView alloc] initWithFrame: [[self view] frame]];

    [self.view addSubview:violetOnSiriWhenDisappearImage];
    [violetOnSiriWhenDisappearImage setContentMode:UIViewContentModeScaleAspectFit];
    [violetOnSiriWhenDisappearImage setClipsToBounds:YES];

    violetOnSiriWhenDisappearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/siriDisappears.png"];

    violetOnSiriWhenDisappearImage.translatesAutoresizingMaskIntoConstraints = NO;


    if (useCustomImage) {
        [NSLayoutConstraint activateConstraints:@[

            [violetOnSiriWhenDisappearImage.widthAnchor constraintEqualToConstant:self.view.bounds.size.width],
            [violetOnSiriWhenDisappearImage.heightAnchor constraintEqualToConstant:self.view.bounds.size.height],
            [violetOnSiriWhenDisappearImage.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:[xPosOnSiri doubleValue]],
            [violetOnSiriWhenDisappearImage.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:[yPosOnSiri doubleValue]]

        ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[

            [violetOnSiriWhenDisappearImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
            [violetOnSiriWhenDisappearImage.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
            [violetOnSiriWhenDisappearImage.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
            [violetOnSiriWhenDisappearImage.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0]

        ]];
    }


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
    if (!useCustomImage) {

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [violetOnSiriWhenDisappearImage setAlpha: 1];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 [violetOnSiriWhenDisappearImage setAlpha: 0];
            });
        });

    }

}

%end

%hook SiriPresentationViewController

- (void)viewWillDisappear:(BOOL)animated {

    %orig;
    if (!useCustomImage) {

        [violetOnSiriWhenDisappearImage setAlpha:1];
        [violetOnSiriWhenAppearImage setAlpha:0];

        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [violetOnSiriWhenDisappearImage setAlpha:0];
            [onSiriBlur setAlpha: 0];
        } completion:nil];
    } else {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [violetOnSiriWhenAppearImage setAlpha:0];
            [onSiriBlur setAlpha: 0];
        } completion:nil];
    }
}

%end

%end

%group VioletOnSpringBoard

%hook SBHomeScreenViewController

- (void)viewWillAppear:(BOOL)animated {
    %orig;
    if (useCustomImageOnUnlock) {
        [NSLayoutConstraint activateConstraints:@[

            [waitingForLord.widthAnchor constraintEqualToConstant:self.view.bounds.size.width],
            [waitingForLord.heightAnchor constraintEqualToConstant:self.view.bounds.size.height],
            [waitingForLord.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:[xPosOnSB doubleValue]],
            [waitingForLord.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:[yPosOnSB doubleValue]]

        ]];
   }
  }

- (void)viewDidLoad {

    %orig;

    if ([blurOnSBAmountValue doubleValue] != 0) {

        if (!blurEffectOnSB) {

            // Adaptable Styles

            if ([blurEffectStyleOnSB intValue] == 0) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterial];
            } else if ([blurEffectStyleOnSB intValue] == 1) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterial];
            } else if ([blurEffectStyleOnSB intValue] == 2) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
            } else if ([blurEffectStyleOnSB intValue] == 3) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterial];
            } else if ([blurEffectStyleOnSB intValue] == 4) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterial];

            // Light Styles

            } else if ([blurEffectStyleOnSB intValue] == 5) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialLight];
            } else if ([blurEffectStyleOnSB intValue] == 6) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialLight];
            } else if ([blurEffectStyleOnSB intValue] == 7) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialLight];
            } else if ([blurEffectStyleOnSB intValue] == 8) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterialLight];
            } else if ([blurEffectStyleOnSB intValue] == 9) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialLight];

            // Dark Styles

            } else if ([blurEffectStyleOnSB intValue] == 10) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemUltraThinMaterialDark];
            } else if ([blurEffectStyleOnSB intValue] == 11) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialDark];
            } else if ([blurEffectStyleOnSB intValue] == 12) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark];
            } else if ([blurEffectStyleOnSB intValue] == 13) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterialDark];
            } else if ([blurEffectStyleOnSB intValue] == 14) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemChromeMaterialDark];

            // Additional Styles

            } else if ([blurEffectStyleOnSB intValue] == 15) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
            } else if ([blurEffectStyleOnSB intValue] == 16) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            } else if ([blurEffectStyleOnSB intValue] == 17) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            } else if ([blurEffectStyleOnSB intValue] == 18) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
            } else if ([blurEffectStyleOnSB intValue] == 19) {
                blurEffectOnSB = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
            }
        }

        if (!onSBoardBlur) {
            onSBoardBlur = [[UIVisualEffectView alloc] initWithEffect:blurEffectOnSB];
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
    if (fillOnSB) {
        [waitingForLord setContentMode:UIViewContentModeScaleAspectFill];
    } else {
        [waitingForLord setContentMode:UIViewContentModeScaleAspectFit];
    }
    [waitingForLord setClipsToBounds:YES];

    waitingForLord.translatesAutoresizingMaskIntoConstraints = NO;

    if (useCustomImageOnUnlock) {
        customImageOnUnlock = [GcImagePickerUtils imageFromDefaults:@"com.appleworm.violetprefrences" withKey:@"CustomImageOnUnlock"];
        waitingForLord.image = customImageOnUnlock;
        [waitingForLord setAlpha: 1];

    } else {
        waitingForLord.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/waitingForLord.png"];

        [NSLayoutConstraint activateConstraints:@[

            [waitingForLord.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:-63],
            [waitingForLord.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
            [waitingForLord.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
            [waitingForLord.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 88]

        ]];
    }

    if (!useCustomImageOnUnlock) {
        helloMaster = [[UIImageView alloc] initWithFrame: [[self view] frame]];

        [self.view addSubview:helloMaster];
        [helloMaster setContentMode:UIViewContentModeScaleAspectFit];
        [helloMaster setClipsToBounds:YES];

        helloMaster.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/helloMyLord.png"];

        helloMaster.translatesAutoresizingMaskIntoConstraints = NO;

        [NSLayoutConstraint activateConstraints:@[

            [helloMaster.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:-63],
            [helloMaster.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
            [helloMaster.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
            [helloMaster.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 88]

        ]];

        [helloMaster setAlpha: 0];

    }

}

%end

%hook SBLockScreenManager

- (void)lockUIFromSource:(int)arg1 withOptions:(id)arg2 {

    %orig;
    if (!useCustomImageOnUnlock) {
        [helloMaster setAlpha:0];
        [waitingForLord setAlpha:1];
    } else {
        [waitingForLord setAlpha:1];
    }
    [onSBoardBlur setAlpha: 0];
    _isUILocked = YES;

}

%end

%hook CSCoverSheetViewController

- (void)viewWillDisappear:(BOOL)animated {

    %orig;
    if (_isUILocked) {
        _isUILocked = NO;
        [onSBoardBlur setAlpha: [blurOnSBAmountValue doubleValue]];
        if (!useCustomImageOnUnlock) {
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
        } else {

         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [UIView animateWithDuration:1 animations:^{
                 [waitingForLord setAlpha:0];
                 [onSBoardBlur setAlpha: 0];
             }];
         });

        }
    }

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
        [preferences registerObject: &blurEffectStyleOnSB default: @"0" forKey: @"BlurStyleOnSB"];
        [preferences registerObject: &xPosOnSB default: @"0" forKey: @"SBXPosition"];
        [preferences registerObject: &yPosOnSB default: @"0" forKey: @"SBYPosition"];
        [preferences registerBool: &useCustomImageOnUnlock default: NO forKey: @"UseCustomImageOnUnlock"];
        [preferences registerBool: &fillOnSB default: NO forKey: @"FillSB"];

    }

    // Violet on Siri
    [preferences registerBool: &showOnSiri default: YES forKey: @"ShowOnSiri"];
    if (showOnSiri) {

        [preferences registerObject: &blurOnSiriAmountValue default: @"0.5" forKey: @"OnSiriBlur"];
        [preferences registerObject: &blurEffectStyleOnSiri default: @"0" forKey: @"BlurStyleOnSiri"];
        [preferences registerObject: &xPosOnSiri default: @"0" forKey: @"SiriXPosition"];
        [preferences registerObject: &yPosOnSiri default: @"0" forKey: @"SiriYPosition"];
        [preferences registerBool: &hideOrb default: YES forKey: @"HideOrb"];
        [preferences registerBool: &useCustomImage default: NO forKey: @"UseCustomImage"];

    }
    if (showOnSB) {
        %init(VioletOnSpringBoard);
    }

    if (showOnSiri) {
        %init(VioletOnSiri);
    }

}
