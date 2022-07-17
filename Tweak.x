#import <UIKit/UIKit.h>
#import "UIGifImage/UIGifImage.h"

@interface SBHomeScreenViewController : UIViewController
@end

@interface CSCoverSheetViewController : UIViewController
@end

%hook SBHomeScreenViewController

-(void)viewWillAppear:(BOOL)arg1 {

    %orig;

    UIImageView * myImageView = [[UIImageView alloc] initWithFrame: [[self view] frame]];
    [self.view addSubview:myImageView];
    [myImageView setContentMode:UIViewContentModeScaleAspectFit];
    [myImageView setClipsToBounds:YES];


    myImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/astolfo.png"];


    myImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [myImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
        [myImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
        [myImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
        [myImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]
    ]];

    [UIView animateWithDuration:30 animations:^{
              [myImageView setAlpha:0];
    }];

}

%end


%hook CSCoverSheetViewController

- (void)viewWillAppear:(bool)arg1{

    %orig;

    UIImageView * myImageView = [[UIImageView alloc] initWithFrame: [[self view] frame]];
    [self.view addSubview:myImageView];
    [myImageView setContentMode:UIViewContentModeScaleAspectFit];
    [myImageView setClipsToBounds:YES];


    myImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/astolfo.png"];

    myImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
            [myImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:25],
            [myImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
            [myImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
            [myImageView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: 175]
    ]];


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{ [myImageView setAlpha:0]; }];
    });

}

%end