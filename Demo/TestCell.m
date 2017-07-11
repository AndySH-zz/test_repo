
#import "TestCell.h"

@interface TestCell()

@property (nonatomic, weak) IBOutlet UIView *accessibilityContent;

@end


@implementation TestCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)updateColor:(UIColor *)color
{
    _accessibilityContent.backgroundColor = color;
}

+ (NSString *)reuseIdentifier
{
    return @"TestCell";
}

@end