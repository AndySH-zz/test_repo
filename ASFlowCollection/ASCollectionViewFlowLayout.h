//
//  ASCollectionViewFlowLayout.h
//  ASFlowCollection
//
//  Created by andy on 2/22/16.
//  Copyright © 2016. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ASCollectionViewFlowLayout: UICollectionViewFlowLayout<UICollectionViewDelegateFlowLayout>

- (instancetype)initWithSections:(NSArray<id<UICollectionViewDelegateFlowLayout> > *)sections;

@end
