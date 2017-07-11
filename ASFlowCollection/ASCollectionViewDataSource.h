//
//  ASCollectionViewDataSource.h
//  ASFlowCollection
//
//  Created by Andy A on 2/22/16.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASSectionDataSource;

@interface ASCollectionViewDataSource: NSObject<UICollectionViewDataSource>

- (instancetype)initWithSections:(NSArray<ASSectionDataSource *> *)sections;

@property (nonatomic, readonly) NSArray<ASSectionDataSource *> *sections;

- (ASSectionDataSource *)sectionByName:(NSString *)name;

@end
