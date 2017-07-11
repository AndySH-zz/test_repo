//
//  ASCollectionViewDataSource.m
//  ASFlowCollection
//
//  Created by Andy A on 2/22/16.
//  Copyright © 2016. All rights reserved.
//

#import "ASCollectionViewDataSource.h"
#import "ASSectionDataSource.h"

@interface ASCollectionViewDataSource ()
{
    NSArray<ASSectionDataSource *> *_sections;
}

@end


@implementation ASCollectionViewDataSource

- (instancetype)initWithSections:(NSArray<ASSectionDataSource *> *)sections
{
    if (self = [super init])
        _sections = [NSArray arrayWithArray:sections];

    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [[self sectionForIndex:section] collectionView:collectionView numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self sectionForIndex:indexPath.section] collectionView:collectionView
                                             cellForItemAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _sections.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    return [[self sectionForIndex:indexPath.section] collectionView:collectionView
                                  viewForSupplementaryElementOfKind:kind
                                                        atIndexPath:indexPath];
}

- (NSString *)debugDescription
{
    return [_sections description];
}

- (ASSectionDataSource *)sectionForIndex:(NSInteger)index
{
    return [_sections objectAtIndex:index];
}

- (ASSectionDataSource *)sectionByName:(NSString *)name
{
    ASSectionDataSource *res = nil;
    for (ASSectionDataSource *s in _sections)
    {
        if ([s.name isEqualToString:name])
        {
            res = s;
            break;
        }
    }

    return res;
}

@end
