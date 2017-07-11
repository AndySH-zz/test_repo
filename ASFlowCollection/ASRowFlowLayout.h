//
//  ASSectionFlowLayout.h
//  ASFlowCollection
//
//  Created by andy on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ASRowFlowLayoutDelegate <NSObject>

@required

- (CGFloat)calculatedHeightForCellAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ASRowFlowLayout: NSObject<UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) CGFloat cellSpacing;
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, weak) id<ASRowFlowLayoutDelegate> delegate;

@end
