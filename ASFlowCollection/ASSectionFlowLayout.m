//
//  ASSectionFlowLayout.m
//  ASFlowCollection
//
//  Created by andy on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import "ASSectionFlowLayout.h"

@interface ASSectionFlowLayout()
{
    NSArray<id<UICollectionViewDelegateFlowLayout>> *_rows;
}

@end

@implementation ASSectionFlowLayout

- (instancetype)initWithRows:(NSArray<UICollectionViewFlowLayout<UICollectionViewDelegateFlowLayout> *> *)rows
{
    if (self = [super init])
        _rows = [NSArray arrayWithArray:rows];
    return self;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;
{
    return _insetForSection;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (_referenceHeightForHeaderInSection > 0) ? CGSizeMake(CGRectGetWidth(collectionView.bounds), _referenceHeightForHeaderInSection) : CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self layoutForIndexPath:indexPath] collectionView:collectionView
                                                              layout:collectionViewLayout
                                              sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [[self layoutForIndexPath:indexPath] collectionView:collectionView
                                     didSelectItemAtIndexPath:indexPath];
}


#pragma mark - Helpers

- (id<UICollectionViewDelegateFlowLayout>)layoutForIndexPath:(NSIndexPath *)indexPath
{
    id<UICollectionViewDelegateFlowLayout> res = indexPath.row < _rows.count ? [_rows objectAtIndex:indexPath.row] : _rows.lastObject;
    return res;
}


@end
