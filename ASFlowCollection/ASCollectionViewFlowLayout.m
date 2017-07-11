//
//  ASCollectionViewFlowLayout.m
//  ASFlowCollection
//
//  Created by andy on 2/22/16.
//  Copyright © 2016. All rights reserved.
//

#import "ASCollectionViewFlowLayout.h"
#import "ASSectionFlowLayout.h"

@interface ASCollectionViewFlowLayout()
{
    NSArray<UICollectionViewFlowLayout<UICollectionViewDelegateFlowLayout> *> *_sections;
}

@end

@implementation ASCollectionViewFlowLayout

- (instancetype)initWithSections:(NSArray<id<UICollectionViewDelegateFlowLayout> > *)sections
{
    if (self = [super init])
        _sections = [NSArray arrayWithArray:sections];
    return self;
}


#pragma mark - UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath;
{
    return YES;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section;
{
    return [[self layoutForSection:section] collectionView:collectionView
                                                  layout:collectionViewLayout
                                  insetForSectionAtIndex:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
                                   referenceSizeForHeaderInSection:(NSInteger)section
{
    return [[self layoutForSection:section] collectionView:collectionView
                                                  layout:collectionViewLayout
                         referenceSizeForHeaderInSection:section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self layoutForSection:indexPath.section] collectionView:collectionView
                                                            layout:collectionViewLayout
                                            sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [[self layoutForSection:indexPath.section] collectionView:collectionView
                                   didSelectItemAtIndexPath:indexPath];
}


#pragma mark - Helpers

- (id<UICollectionViewDelegateFlowLayout>)layoutForSection:(NSInteger)index
{
    return [_sections objectAtIndex:index];
}

@end
