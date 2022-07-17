#import <UIKit/UIKit.h>


@interface SBHomeScreenViewController : UIViewController
@end

@interface CSCoverSheetViewController : UIViewController
@end

@interface SiriUIBackgroundBlurViewController : UIViewController
@end

@interface AFUISiriViewController : UIViewController
@end

UIImageView * myImageView = nil;
UIImageView * violetOnSiriWhenAppearImage;
UIImageView * violetOnSiriWhenDisappearImage;

// thanks Alexa
%hook SiriUIBackgroundBlurViewController

- (void)viewDidLoad {
    %orig;
violetOnSiriWhenAppearImage = [[UIImageView alloc] initWithFrame: [[self view] frame]];
[self.view addSubview:violetOnSiriWhenAppearImage];
[violetOnSiriWhenAppearImage setContentMode:UIViewContentModeScaleAspectFit];
[violetOnSiriWhenAppearImage setClipsToBounds:YES];
violetOnSiriWhenAppearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/siriAppears.png"];

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
violetOnSiriWhenDisappearImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/siriDisappears.png"];

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
} completion:nil];
}

%end

%hook SBHomeScreenViewController

-(void)viewDidLoad {
    %orig;

myImageView = [[UIImageView alloc] initWithFrame: [[self view] frame]];
[self.view addSubview:myImageView];
[myImageView setContentMode:UIViewContentModeScaleAspectFit];
[myImageView setClipsToBounds:YES];
myImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/helloMyLord.png"];

myImageView.translatesAutoresizingMaskIntoConstraints = NO;
[NSLayoutConstraint activateConstraints:@[
[myImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
[myImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
[myImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
[myImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]
]];

}

//-(void)viewWillAppear:(BOOL)arg1 {
//
//    %orig;
//
//    [myImageView setAlpha:1];
//
//    [UIView animateWithDuration:30 animations:^{
//              [myImageView setAlpha:0];
//    }];
//
//}


%end


%hook SBLockScreenManager

- (void)lockUIFromSource:(int)arg1 withOptions:(id)arg2 { // pause when the device was locked

%orig;
[myImageView setAlpha:1];

}


// Срабатывает когда локскрин убирается уже у активированного устройства

//-(void)lockScreenViewControllerDidDismiss {
//[UIView animateWithDuration:30 animations:^{
//[myImageView setAlpha:0];
//}];
//}

%end

%hook CSCoverSheetViewController

//- (void)viewWillAppear:(bool)arg1{
//
//    %orig;
//
//    UIImageView * myImageView = [[UIImageView alloc] initWithFrame: [[self view] frame]];
//    [self.view addSubview:myImageView];
//    [myImageView setContentMode:UIViewContentModeScaleAspectFit];
//    [myImageView setClipsToBounds:YES];
//
//
//    myImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/astolfo.png"];
//
//    myImageView.translatesAutoresizingMaskIntoConstraints = NO;
//    [NSLayoutConstraint activateConstraints:@[
//            [myImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
//            [myImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
//            [myImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
//            [myImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]
//    ]];
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:1 animations:^{ [myImageView setAlpha:0]; }];
//    });
//
//
//}

- (void)viewWillDisappear:(BOOL)animated { // pause when the lockscreen disappears
    %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{ [myImageView setAlpha:0]; }];
    });

}

%end
