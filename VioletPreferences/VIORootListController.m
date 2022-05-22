#import <Foundation/Foundation.h>
#import "VIORootListController.h"

@implementation VIORootListController

-(void)viewDidLoad {

    [super viewDidLoad];
    
    self.appearanceSettings = [VIOPBAppearance new];
    self.hb_appearanceSettings = [self appearanceSettings];
    self.preferences = [[HBPreferences alloc] initWithIdentifier:@"com.appleworm.violetprefrences"];

    self.enableVioletSwitch = [UISwitch new];
    [[self enableVioletSwitch] setOnTintColor:[UIColor colorWithRed:0.02 green:0.14 blue:0.28 alpha:1]];
    [[self enableVioletSwitch] addTarget:self action:@selector(setEnabled) forControlEvents:UIControlEventTouchUpInside];


    self.barItem = [[UIBarButtonItem alloc] initWithCustomView:[self enableVioletSwitch]];
    self.navigationItem.rightBarButtonItem = [self barItem];
    [[self navigationItem] setRightBarButtonItem:[self barItem]];


    self.navigationItem.titleView = [UIView new];

    self.VioletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [[self VioletLabel] setFont:[UIFont boldSystemFontOfSize:25]];
    [[self VioletLabel] setText:@"Violet"];
    [[self VioletLabel] setTextColor:[UIColor labelColor]];
    [[self VioletLabel] setTextAlignment:NSTextAlignmentCenter];
    [[[self navigationItem] titleView] addSubview:[self VioletLabel]];

    self.VioletLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
            [self.VioletLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.VioletLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.VioletLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.VioletLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
    ]];

    self.VioletVersionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [[self VioletVersionLabel] setFont:[UIFont boldSystemFontOfSize:17]];
    [[self VioletVersionLabel] setText:@"v1.0.0"];
    [[self VioletVersionLabel] setTextColor:[UIColor labelColor]];
    [[self VioletVersionLabel] setTextAlignment:NSTextAlignmentCenter];
    [[[self navigationItem] titleView] addSubview:[self VioletVersionLabel]];

    self.VioletVersionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
            [self.VioletVersionLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.VioletVersionLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.VioletVersionLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.VioletVersionLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
    ]];

    [[self VioletVersionLabel] setAlpha:0];

    self.PBHeaderView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];

    self.PBHeaderImageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    [self.PBHeaderView addSubview: self.PBHeaderImageView];

    self.PBHeaderImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/header.png"];;
    [self.PBHeaderImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.PBHeaderImageView setClipsToBounds:YES];

    self.PBHeaderImageView.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [self.PBHeaderImageView.topAnchor constraintEqualToAnchor: self.PBHeaderView.topAnchor constant:0],
            [self.PBHeaderImageView.leadingAnchor constraintEqualToAnchor:self.PBHeaderView.leadingAnchor constant:0],
            [self.PBHeaderImageView.trailingAnchor constraintEqualToAnchor:self.PBHeaderView.trailingAnchor constant:0],
            [self.PBHeaderImageView.bottomAnchor constraintEqualToAnchor:self.PBHeaderView.bottomAnchor constant: 0]

    ]];

    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.blurOnPBScreen = [[UIVisualEffectView alloc] initWithEffect:[self blurEffect]];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [self setUpEnabledSwitch];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    [[self blurOnPBScreen] setFrame:[[self view] bounds]];
    [[self blurOnPBScreen] setAlpha:1];
    [[self view] addSubview:[self blurOnPBScreen]];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[self blurOnPBScreen] setAlpha:0];
    } completion:nil];

}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [[self blurOnPBScreen] setAlpha:1];

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [[self blurOnPBScreen] setAlpha:0];
    } completion:nil];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];



    [[self titleTimer] invalidate];
    self.titleTimer =  [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(changeLabel)
                                   userInfo:nil
                                    repeats:YES];

}


- (void) changeLabel {
    if ([[self VioletLabel] alpha] == 0 && [[self VioletVersionLabel] alpha] == 1) {
        [UIView animateWithDuration:0.3 animations:^{
            [[self VioletVersionLabel] setAlpha:0];
            [[self VioletLabel] setAlpha:1];
        }];
        return;
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            [[self VioletVersionLabel] setAlpha:1];
            [[self VioletLabel] setAlpha:0];
        }];
        return;
    }
}


- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }

    return _specifiers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    tableView.tableHeaderView = [self PBHeaderView];

    return [super tableView:tableView cellForRowAtIndexPath:indexPath];

}

- (void)setEnabled {

    [[self violetImage] removeFromSuperview];
    self.violetImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 55, 375, 667)];

    [[self blurOnPBScreen] setFrame:[[self view] bounds]];
    [[self view] addSubview:[self blurOnPBScreen]];
    [[self view] addSubview:[self violetImage]];
    [[self violetImage] setAlpha:0];

    if ([[[self preferences] objectForKey:@"Enabled"] isEqual:@(YES)]) {

        [[self preferences] setBool:NO forKey:@"Enabled"];


        [[self blurOnPBScreen] setAlpha:0];
        self.violetImage.image = [UIImage new];
        self.violetImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/disableViolet.png"];
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [[self violetImage] setAlpha:1];
        } completion:nil];
        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [[self blurOnPBScreen] setAlpha:1];
        } completion:^(BOOL finished) {
            [self doRespring];
        }];

    } else {

        [[self preferences] setBool:YES forKey:@"Enabled"];

        [[self blurOnPBScreen] setAlpha:0];

        self.violetImage.image = [UIImage new];
        self.violetImage.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/VioletPreferences.bundle/Violetsbehavor/enableViolet.png"];

        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [[self violetImage] setAlpha:1];
        } completion:nil];

        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [[self blurOnPBScreen] setAlpha:1];
        } completion:^(BOOL finished) {
            [self doRespring];
        }];

    }

}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    CGPoint scrollViewOffset = scrollView.contentOffset;
    if (scrollViewOffset.y < -60) {
        scrollViewOffset.y = -60;
    }
    [scrollView setContentOffset:scrollViewOffset];
}

- (void)setUpEnabledSwitch {

    if ([[[self preferences] objectForKey:@"Enabled"] isEqual:@(YES)])
        [[self enableVioletSwitch] setOn:YES animated:YES];
    else
        [[self enableVioletSwitch] setOn:NO animated:YES];

}


- (void)doRespring {
    [HBRespringController respring];
}

- (void)justaRespring {

    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [[self blurOnPBScreen] setAlpha:1];
    } completion:^(BOOL finished) {
        [HBRespringController respring];
    }];

}

- (void)goVK {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://vk.com/f4ther_of_all"] options:@{} completionHandler:nil];
}

- (void)goGH {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/AppIeWorm"] options:@{} completionHandler:nil];
}

- (void)goTG {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/Uncle_Milty"] options:@{} completionHandler:nil];
}

@end
