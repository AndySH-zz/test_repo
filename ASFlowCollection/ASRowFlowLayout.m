//
//  ASRowFlowLayout.m
//  ASFlowCollection
//
//  Created by andy on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import "ASRowFlowLayout.h"

@implementation ASRowFlowLayout

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = _cellHeight == 0 ? [_delegate calculatedHeightForCellAtIndexPath:indexPath] : _cellHeight;
    CGFloat width = _cellWidth;

    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

@end
