#import <Foundation/Foundation.h>
#import "VIORootListController.h"

@implementation VIORootListController

//- (NSArray *)specifiers {
//	if (!_specifiers) {
//		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
//	}
//
//	return _specifiers;
//}

-(void)viewDidLoad {


    self.appearanceSettings = [VIOAppearanceSettings new];
    self.hb_appearanceSettings = [self appearanceSettings];
    self.preferences = [[HBPreferences alloc] initWithIdentifier:@"com.appleworm.violetprefrences"];

    self.enableSwitch = [UISwitch new];
    [[self enableSwitch] setOnTintColor:[UIColor colorWithRed:0.02 green:0.14 blue:0.28 alpha:1]];
    [[self enableSwitch] addTarget:self action:@selector(setEnabled) forControlEvents:UIControlEventTouchUpInside];


    self.item = [[UIBarButtonItem alloc] initWithCustomView:[self enableSwitch]];
    self.navigationItem.rightBarButtonItem = [self item];
    [[self navigationItem] setRightBarButtonItem:[self item]];


    self.navigationItem.titleView = [UIView new];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [[self titleLabel] setFont:[UIFont boldSystemFontOfSize:17]];
    [[self titleLabel] setText:@"1.0.0"];
    [[self titleLabel] setTextColor:[UIColor whiteColor]];
    [[self titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[[self navigationItem] titleView] addSubview:[self titleLabel]];

    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
            [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
    ]];

    self.headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [self.headerView setBackgroundColor: [ UIColor redColor ]];
    [self.view addSubview: self.headerView];

    self.headerImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [self.headerView addSubview: self.headerImageView];

    UIImage * myImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/logo.png"];
    self.headerImageView.image = myImage;
    [self.headerImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.headerImageView setClipsToBounds:YES];


    self.headerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[
            [self.headerView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0],
            [self.headerView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
            [self.headerView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
            [self.headerView.heightAnchor constraintEqualToConstant:200],

            [self.headerImageView.topAnchor constraintEqualToAnchor: self.headerView.topAnchor constant:0],
            [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor constant:0],
            [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor constant:0],
            [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor constant: 0]

    ]];

    // thanks Alexa
    self.blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:[self blur]];



}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [[self blurView] setFrame:[[self view] bounds]];
    [[self blurView] setAlpha:1];
    [[self view] addSubview:[self blurView]];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[self blurView] setAlpha:0];
    } completion:nil];

}


-(void)setEnabled {
    [[self blurView] setFrame:[[self view] bounds]];
    [[self view] addSubview: [self blurView]];

    if ([[self enableSwitch] isOn]) {
        [[self blurView] setAlpha:0];
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [[self blurView] setAlpha:1];
        }                completion:nil];
    } else {
        [[self blurView] setAlpha: 1];
        [UIView animateWithDuration:0.4 delay:0 options: UIViewAnimationOptionCurveEaseIn animations:^{
            [[self blurView] setAlpha:0];
        } completion:nil];
    }


}

@end
