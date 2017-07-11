//
//  ASSectionFlowLayout.h
//  ASFlowCollection
//
//  Created by andy on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ASSectionFlowLayout: NSObject<UICollectionViewDelegateFlowLayout>

- (instancetype)initWithRows:(NSArray<id<UICollectionViewDelegateFlowLayout> > *)rows;

@property (nonatomic, assign) UIEdgeInsets insetForSection;
@property (nonatomic, assign) CGFloat referenceHeightForHeaderInSection;

@end
