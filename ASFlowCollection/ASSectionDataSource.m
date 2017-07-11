//
//  ASSectionDataSource.m
//  ASFlowCollection
//
//  Created by Andy A on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import "ASSectionDataSource.h"


@interface ASSectionDataSource ()
{
    NSMutableArray *_items;
}

@end

@implementation ASSectionDataSource

- (instancetype)init
{
    if (self = [super init])
        _items = [NSMutableArray array];
    return self;
}

- (void)addItems:(NSArray *)items
{
    [_items addObjectsFromArray:items];
}

- (void)clear
{
    [_items removeAllObjects];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [self count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id itemObj = [self itemAtIndexPath:indexPath];
    NSString *dequeId = self.cellIdBlock(indexPath, itemObj);
    UICollectionViewCell *theCell = [collectionView dequeueReusableCellWithReuseIdentifier:dequeId
                                                                              forIndexPath:indexPath];
    
    if (!theCell && self.createCellBlock)
        self.createCellBlock(indexPath, itemObj);

    theCell.layer.shouldRasterize = YES;
    theCell.layer.rasterizationScale = [UIScreen mainScreen].scale;

    BOOL moving = (collectionView.decelerating || collectionView.dragging);
    self.configureCellBlock(theCell, itemObj, moving);
    return theCell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self count] > 0 ? 1 : 0;
}

- (NSUInteger)count
{
    return _items.count;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_items objectAtIndex:indexPath.row];
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"ASSectionDataSource with items %@ \n", _items];
}

@end
