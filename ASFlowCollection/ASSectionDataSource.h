//
//  ASSectionDataSource.h
//  ASFlowCollection
//
//  Created by Andy A on 2/22/16.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString * (^ASFlowCollectionCellIdentifier)(NSIndexPath *indexPath, id dataObject);
typedef UICollectionViewCell * (^ASFlowCollectionCreateCell)(NSIndexPath *indexPath, id dataObject);
typedef void (^ASFlowCollectionCellConfigure)(UICollectionViewCell *cell, id dataObject, BOOL moving);


@interface ASSectionDataSource: NSObject<UICollectionViewDataSource>

- (void)addItems:(NSArray *)items;
- (void)clear;

@property (nonatomic, copy) ASFlowCollectionCellConfigure configureCellBlock;
@property (nonatomic, copy) ASFlowCollectionCellIdentifier cellIdBlock;
@property (nonatomic, copy) ASFlowCollectionCreateCell createCellBlock;

@property (nonatomic, strong) NSString *name;

@end
