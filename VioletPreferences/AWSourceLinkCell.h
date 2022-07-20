
//
//  AWSourceLinkCell.h
//
//           by AppleWorm
//
#import <Preferences/PSSpecifier.h>
#import <UIKit/UIKit.h>

@interface AWSourceLinkCell : PSTableCell

@property(nonatomic, retain)UIImageView * userAvatar;
@property(nonatomic, retain)UIImageView * sourceArea;
@property(nonatomic, retain)UIImage * sourceImage;
@property(nonatomic, retain)UILabel * headerTextArea;
@property(nonatomic, retain)UILabel * footerTextArea;
// Cell properties
@property(nonatomic, retain)NSString * source;
@property(nonatomic, retain)NSString * userName;
@property(nonatomic, retain)NSString * headerText;
@property(nonatomic, retain)NSString * footerText;
@property(nonatomic, retain)NSString * urlToImage;
@property(nonatomic, retain)NSString * color;
@property(nonatomic, retain)NSString * srcImage; // system only

@property(nonatomic, retain)UIView * tapArea;
@property(nonatomic, retain)UITapGestureRecognizer * cellTap;

-(void)visitSource;

@end