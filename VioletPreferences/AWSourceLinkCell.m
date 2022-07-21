
//
//  AWSourceLinkCell.h
//
//           by AppleWorm
//


#import "AWSourceLinkCell.h"

@implementation AWSourceLinkCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier specifier:(PSSpecifier *)specifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

    UIColor * tintColor = [UIColor labelColor];
    UIColor * FTColor = [UIColor new];
    UIColor * CntrColor = [UIColor new];
    UIColor * RIColor = [UIColor new];

    self.source = specifier.properties[@"source"];
    self.userName = specifier.properties[@"username"];
    self.urlToImage = specifier.properties[@"image"];
    self.square = specifier.properties[@"square"];
    self.customSource = specifier.properties[@"customSource"];
    self.link = specifier.properties[@"link"];


    self.headerText = specifier.properties[@"headerText"];
    self.color = specifier.properties[@"tintColor"];

    self.footerText = specifier.properties[@"footerText"];
    self.footerTextColor = specifier.properties[@"footerTextColor"];
    self.useTintForFooterText = specifier.properties[@"tintedFooterText"];

    self.contour = specifier.properties[@"contour"];
    self.contourColor = specifier.properties[@"contourColor"];
    self.useTintForContour = specifier.properties[@"tintedContour"];

    self.srcImage = specifier.properties[@"rightImage"]; // system only
    self.rightImageColor = specifier.properties[@"rightImageColor"];
    self.useTintForRightImage = specifier.properties[@"tintedRightImage"];



    if (![self headerText]) {
        self.headerText = self.userName;
    }

    if (![self footerText]) {

        if ([self customSource]) {
            self.footerText = [self customSource];
        } else {
            self.footerText = [self source];
        }

    }

    if ([self color]) {
        tintColor = [self UIColorWithHEX:[self color]];
    }

    if ([self footerTextColor]) {
        FTColor = [self UIColorWithHEX:[self footerTextColor]];
    }

    if ([self contourColor]) {
        CntrColor = [self UIColorWithHEX:[self contourColor]];
    }

    if ([self rightImageColor]) {
        RIColor = [self UIColorWithHEX:[self rightImageColor]];
    }

    self.sourceArea = [UIImageView new];
    [[self sourceArea] setTintColor:[UIColor labelColor]];
    self.sourceImage = [UIImage new];
    [self addSubview:[self sourceArea]];

    if ([self srcImage]) {

        self.sourceImage = [UIImage systemImageNamed: [self srcImage]];

    } else {

        if ([[self source] isEqual:@"Telegram"]) {

            self.sourceImage = [UIImage systemImageNamed:@"paperplane"];

        } else if ([[self source] isEqual:@"GitHub"]) {

            self.sourceImage = [UIImage systemImageNamed:@"terminal"];

        } else {
            self.sourceImage = [UIImage new];
        }
    }

    [[self sourceArea] setImage:[self sourceImage]];

    if ([self useTintForRightImage]) {
        [[self sourceArea] setTintColor: tintColor];
    } else if ([self rightImageColor]){
        [[self sourceArea] setTintColor: RIColor];
    } else {
        [[self sourceArea] setTintColor: [UIColor labelColor]];
    }

    self.sourceArea.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [[[self sourceArea] topAnchor] constraintEqualToAnchor:[self topAnchor] constant:22],
            [[[self sourceArea] trailingAnchor] constraintEqualToAnchor:[self trailingAnchor] constant:-16],
            [[[self sourceArea] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor] constant:-22],
            [[[self sourceArea] widthAnchor] constraintEqualToConstant:19],
            [[[self sourceArea] heightAnchor] constraintEqualToConstant:16]

    ]];

    self.userAvatar = [UIImageView new];
    self.userName = [NSString stringWithFormat:@"%@", [[[self userName] componentsSeparatedByString:@"@"] lastObject]];

    if ([self urlToImage]) {

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

            UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self urlToImage]]]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    [[self userAvatar] setImage:avatar];
                }               completion:nil];
            });
        });

    } else {

        if ([self customSource]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                        [[self userAvatar] setImage: [UIImage new]];
                    }               completion:nil];
                });
        } else {

            if ([[self source] isEqual:@"Telegram"]) {

                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

                    UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://unavatar.io/telegram/%@", [self userName]]]]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                            [[self userAvatar] setImage:avatar];
                        }               completion:nil];
                    });
                });

            } else if ([[self source] isEqual:@"GitHub"]) {

                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

                    UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://unavatar.io/github/%@", [self userName]]]]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                            [[self userAvatar] setImage:avatar];
                        }               completion:nil];
                    });
                });

            } else if ([[self source] isEqual:@"Twitter"]) {

                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

                    UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://unavatar.io/twitter/%@", [self userName]]]]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                            [[self userAvatar] setImage:avatar];
                        }               completion:nil];
                    });
                });

            } else if ([[self source] isEqual: @"Reddit"]) {
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

                    UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://unavatar.io/reddit/%@", [self userName]]]]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                            [[self userAvatar] setImage:avatar];
                        }               completion:nil];
                    });
                });
                
            } else {

                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul), ^{

                    UIImage *avatar = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://unavatar.io/instagram/%@", [self userName]]]]];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView transitionWithView:[self userAvatar] duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                            [[self userAvatar] setImage:avatar];
                        }               completion:nil];
                    });
                });

            }
        }
}
    if ([self contour]) {

        UILabel * avatarContour = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 46, 46)];
        [self addSubview: avatarContour];
        [avatarContour setBackgroundColor: [UIColor colorWithWhite: 0 alpha: 0]];
        [[avatarContour layer] setBorderWidth:2];

        if ([self square]) {
            if ([self square] == false) {
                [[avatarContour layer] setCornerRadius: 20];
            } else {
                [[avatarContour layer] setCornerRadius: 13.5];
            }
        } else {
            [[avatarContour layer] setCornerRadius: 23];
        }

        if ([self useTintForContour]) {
            [[avatarContour layer] setBorderColor:[[tintColor colorWithAlphaComponent:1] CGColor]];
        } else if ([self contourColor]) {
            [[avatarContour layer] setBorderColor:[[CntrColor colorWithAlphaComponent:1] CGColor]];
        } else {

            if (@available(iOS 12.0, *)) {
                switch (UIScreen.mainScreen.traitCollection.userInterfaceStyle) {
                    case UIUserInterfaceStyleDark:
                        [[avatarContour layer] setBorderColor:[[UIColor whiteColor] CGColor]];
                        break;
                    case UIUserInterfaceStyleLight:
                        [[avatarContour layer] setBorderColor:[[UIColor blackColor] CGColor]];
                        break;
                    case UIUserInterfaceStyleUnspecified:
                        [[avatarContour layer] setBorderColor:[[UIColor whiteColor] CGColor]];
                        break;
                }
            }
        }

        avatarContour.translatesAutoresizingMaskIntoConstraints = NO;

        [NSLayoutConstraint activateConstraints:@[

                [[avatarContour topAnchor] constraintEqualToAnchor:[self topAnchor] constant:7],
                [[avatarContour leadingAnchor] constraintEqualToAnchor:[self leadingAnchor] constant:12],
                [[avatarContour bottomAnchor] constraintEqualToAnchor:[self bottomAnchor] constant:-7],
                [[avatarContour widthAnchor] constraintEqualToConstant:46]
        ]];

    }

    [self addSubview:[self userAvatar]];

    [[self userAvatar] setContentMode:UIViewContentModeScaleAspectFill];
    [[[self userAvatar] layer] setBorderColor:[[tintColor colorWithAlphaComponent:0.1] CGColor]];
    [[[self userAvatar] layer] setBorderWidth:2];
    [[self userAvatar] setClipsToBounds:YES];

    if ([self square]) {
        [[[self userAvatar] layer] setCornerRadius:10];
    } else {
        [[[self userAvatar] layer] setCornerRadius:19];
    }

    self.userAvatar.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [[[self userAvatar] topAnchor] constraintEqualToAnchor:[self topAnchor] constant:11],
            [[[self userAvatar] leadingAnchor] constraintEqualToAnchor:[self leadingAnchor] constant:16],
            [[[self userAvatar] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor] constant:-11],
            [[[self userAvatar] widthAnchor] constraintEqualToConstant:38]
    ]];


    self.headerTextArea = [UILabel new];
    [self addSubview:[self headerTextArea]];

    if ([[self headerText] isEqual:[self userName]]) {
        if ([[self source] isEqual:@"GitHub"]) {
            [[self headerTextArea] setText:[self headerText]];
        } else {
            [[self headerTextArea] setText:[NSString stringWithFormat:@"@%@", [self headerText]]];
        }
    } else {
        [[self headerTextArea] setText:[self headerText]];
    }

    [[self headerTextArea] setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]];
    [[self headerTextArea] setTextColor:tintColor];

    self.headerTextArea.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [[[self headerTextArea] topAnchor] constraintEqualToAnchor:[self topAnchor] constant:11],
            [[[self headerTextArea] leadingAnchor] constraintEqualToAnchor:[[self userAvatar] trailingAnchor] constant:16],
            [[[self headerTextArea] heightAnchor] constraintEqualToConstant:21]

    ]];


    self.footerTextArea = [UILabel new];

    [self addSubview:[self footerTextArea]];

    [[self footerTextArea] setText:[self footerText]];
    [[self footerTextArea] setFont:[UIFont systemFontOfSize:11 weight:UIFontWeightRegular]];

    if ([self useTintForFooterText]) {
        [[self footerTextArea] setTextColor:[tintColor colorWithAlphaComponent:0.6]];
    } else if ([self footerTextColor]) {
        [[self footerTextArea] setTextColor:[FTColor colorWithAlphaComponent:0.6]];
    } else {
        [[self footerTextArea] setTextColor:[[UIColor labelColor] colorWithAlphaComponent:0.6]];
    }

    self.footerTextArea.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [[[self footerTextArea] topAnchor] constraintEqualToAnchor:[[self headerTextArea] bottomAnchor] constant:2],
            [[[self footerTextArea] leadingAnchor] constraintEqualToAnchor:[[self userAvatar] trailingAnchor] constant:16],
            [self.headerTextArea.heightAnchor constraintEqualToConstant:21]

    ]];


    self.tapArea = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 376, 60)];
    [self addSubview:[self tapArea]];

    self.tapArea.translatesAutoresizingMaskIntoConstraints = NO;

    [NSLayoutConstraint activateConstraints:@[

            [[[self tapArea] topAnchor] constraintEqualToAnchor:[self topAnchor] constant:0],
            [[[self tapArea] bottomAnchor] constraintEqualToAnchor:[self bottomAnchor] constant:0],
            [[[self tapArea] leadingAnchor] constraintEqualToAnchor:[self leadingAnchor] constant:0],
            [[[self tapArea] trailingAnchor] constraintEqualToAnchor:[self leadingAnchor] constant:0]

    ]];


    self.cellTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(visitSource)];
    [[self tapArea] addGestureRecognizer:[self cellTap]];


    return self;

}

- (void)visitSource {

    if ([self customSource]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self link]] options:@{} completionHandler:nil];
    } else {
        if ([[self source] isEqual:@"VK"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://vk.com/%@", [self userName]]] options:@{} completionHandler:nil];
        } else if ([[self source] isEqual:@"Telegram"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://t.me/%@", [self userName]]] options:@{} completionHandler:nil];
        } else if ([[self source] isEqual:@"GitHub"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://github.com/%@", [self userName]]] options:@{} completionHandler:nil];
        } else if ([[self source] isEqual:@"Twitter"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/%@", [self userName]]] options:@{} completionHandler:nil];
        } else if ([[self source] isEqual: @"Reddit"]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.reddit.com/user/%@", [self userName]]] options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://instagram.com/%@", [self userName]]] options:@{} completionHandler:nil];
        }
    }
}

- (UIColor *)UIColorWithHEX:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0 green:((rgbValue & 0xFF00)
            >> 8) / 255.0   blue:(rgbValue & 0xFF) / 255.0 alpha:1.0];
}

@end
