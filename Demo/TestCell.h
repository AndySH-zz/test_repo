
#import <UIKit/UIKit.h>

@interface TestCell: UICollectionViewCell

+ (NSString *)reuseIdentifier;

- (void)updateColor:(UIColor *)color;

@end
