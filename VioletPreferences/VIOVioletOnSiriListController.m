#import "VIOVioletOnSiriListController.h"

@implementation VIOVioletOnSiriListController


- (void)viewDidLoad {

    self.appearanceSettings = [VIOPBAppearance new];
    self.hb_appearanceSettings = [self appearanceSettings];

    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.preferenceBundleSiriSectionBlur = [[UIVisualEffectView alloc] initWithEffect:[self blurEffect]];

    [[self preferenceBundleSiriSectionBlur] setAlpha:1];
    [[self preferenceBundleSiriSectionBlur] setFrame: [[self view] bounds] ];
    [[self view] addSubview:[self preferenceBundleSiriSectionBlur]];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{ [[self preferenceBundleSiriSectionBlur] setAlpha:0]; } completion:nil];

}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{ [[self preferenceBundleSiriSectionBlur] setAlpha:1]; } completion:nil];

}


- (id)specifiers { return _specifiers; }

- (void)loadFromSpecifier:(PSSpecifier *)specifier {

    NSString * subController = [specifier propertyForKey:@"VIOSubController"];
    NSString * name = [specifier name];

    _specifiers = [self loadSpecifiersFromPlistName:subController target:self];

    [self setTitle:name];
    [[self navigationItem] setTitle:name];

}

- (void)setSpecifier:(PSSpecifier *)specifier {

    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];

}

- (BOOL)shouldReloadSpecifiersOnResume { return false; }

-(void)thanksAlexa {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Traurige"] options:@{} completionHandler:nil];
}

@end