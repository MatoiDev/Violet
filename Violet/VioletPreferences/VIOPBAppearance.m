#import "VIORootListController.h"

@implementation VIOPBAppearance

- (UIColor *)tintColor { return [UIColor colorWithRed: 0.8 green: 0.8 blue: 1 alpha: 1.00]; }
- (UIColor *)statusBarTintColor { return [UIColor labelColor]; }
- (UIColor *)navigationBarTitleColor { return [UIColor labelColor]; }
- (UIColor *)navigationBarTintColor { return [UIColor labelColor]; }
- (UIColor *)tableViewCellSeparatorColor { return [UIColor colorWithWhite:0.5 alpha:0.5]; }
- (UIColor *)navigationBarBackgroundColor { return [UIColor colorWithRed: 0.8 green: 0.8 blue: 1 alpha: 1.00]; }
- (BOOL)translucentNavigationBar { return YES; }

@end
