#import "VIOVioletOnSpringBoardListController.h"


@implementation VIOVioletOnSpringBoardListController

- (UITableViewStyle)tableViewStyle {
    return UITableViewStyleInsetGrouped;
}

- (void)viewDidLoad {

    self.appearanceSettings = [VIOPBAppearance new];
    self.hb_appearanceSettings = [self appearanceSettings];

    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.preferenceBundleOnSpringBoardSectionBlur = [[UIVisualEffectView alloc] initWithEffect:[self blurEffect]];

    [[self preferenceBundleOnSpringBoardSectionBlur] setAlpha:1];
    [[self preferenceBundleOnSpringBoardSectionBlur] setFrame: [[self view] bounds] ];
    [[self view] addSubview:[self preferenceBundleOnSpringBoardSectionBlur]];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [[self preferenceBundleOnSpringBoardSectionBlur] setAlpha:1];
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{ [[self preferenceBundleOnSpringBoardSectionBlur] setAlpha:0]; } completion:nil];

}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{ [[self preferenceBundleOnSpringBoardSectionBlur] setAlpha:1]; } completion:nil];

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

@end