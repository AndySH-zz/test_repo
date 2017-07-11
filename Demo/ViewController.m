//
//  ViewController.m
//  Demo
//
//  Created by Andy A on 2/23/16.
//  Copyright © 2016. All rights reserved.
//

#import <ASFlowCollection/ASFlowCollection.h>


#import "ViewController.h"
#import "TestCell.h"

@interface ViewController ()<ASRowFlowLayoutDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *colView;
@property (nonatomic, copy) ASFlowCollectionCellConfigure cellConfigBlock;
@property (nonatomic, copy) ASFlowCollectionCellIdentifier cellIdentifierBlock;

@property (nonatomic, strong) ASCollectionViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self registerCells];

    ASFlowCollectionCellConfigure configureBlock = ^(id cell, id dataObject, BOOL moving)
    {
        [((TestCell *)cell) updateColor:(UIColor *)dataObject];
    };

    self.cellConfigBlock = configureBlock;

    ASFlowCollectionCellIdentifier cellIdentifierBlock = ^(NSIndexPath *indexPath, id dataObject)
    {
        return [TestCell reuseIdentifier];
    };

    self.cellIdentifierBlock = cellIdentifierBlock;

    ASSectionDataSource *redSectionSource = [self setupRedSectionDataSource];
    ASSectionDataSource *greenSectionSource = [self setupGreenSectionDataSource];
    ASSectionDataSource *blueSectionSource = [self setupBlueSectionDataSource];
    _dataSource = [[ASCollectionViewDataSource alloc] initWithSections:@[redSectionSource, greenSectionSource, blueSectionSource]];

    ASSectionFlowLayout *redSectionFlow = [self setupRedSectionFlow];
    ASSectionFlowLayout *greenSectionFlow = [self setupGreenSectionFlow];
    ASSectionFlowLayout *blueSectionFlow = [self setupBlueSectionFlow];
    ASCollectionViewFlowLayout *layout = [[ASCollectionViewFlowLayout alloc] initWithSections:@[redSectionFlow, greenSectionFlow, blueSectionFlow]];

    _colView.dataSource = _dataSource;
    _colView.collectionViewLayout = layout;
    _colView.delegate = layout;
}

- (ASSectionDataSource *)setupRedSectionDataSource
{
    ASSectionDataSource *src = [[ASSectionDataSource alloc] init];
    src.configureCellBlock = _cellConfigBlock;
    src.cellIdBlock = _cellIdentifierBlock;

    [src addItems:@[[UIColor redColor], [UIColor redColor], [UIColor redColor], [UIColor redColor]]];
    src.name = @"red";

    return src;
}

- (ASSectionFlowLayout *)setupRedSectionFlow
{
    NSMutableArray <ASRowFlowLayout *> *rows = [[NSMutableArray alloc] init];

    ASRowFlowLayout *headRow = [[ASRowFlowLayout alloc] init];
    headRow.delegate = self;
    headRow.cellSpacing = 10.0;
    headRow.cellWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - 2 * headRow.cellSpacing;

    [rows addObject:headRow];

    ASRowFlowLayout *simpleRow = [[ASRowFlowLayout alloc] init];
    simpleRow.delegate = self;
    simpleRow.cellSpacing = 5.0;
    simpleRow.cellWidth = CGRectGetWidth([UIScreen mainScreen].bounds) / 3.0 - headRow.cellSpacing - simpleRow.cellSpacing;
    simpleRow.cellHeight = 50.0;

    [rows addObject:simpleRow];


    ASSectionFlowLayout *section = [[ASSectionFlowLayout alloc] initWithRows:rows];
    section.insetForSection = UIEdgeInsetsMake(20.0, headRow.cellSpacing, headRow.cellSpacing, headRow.cellSpacing);

    return section;
}

- (ASSectionDataSource *)setupGreenSectionDataSource
{
    ASSectionDataSource *src = [[ASSectionDataSource alloc] init];
    src.configureCellBlock = _cellConfigBlock;
    src.cellIdBlock = _cellIdentifierBlock;

    [src addItems:@[[UIColor greenColor], [UIColor greenColor]]];
    src.name = @"green";

    return src;
}

- (ASSectionFlowLayout *)setupGreenSectionFlow
{
    NSMutableArray <ASRowFlowLayout *> *rows = [[NSMutableArray alloc] init];

    ASRowFlowLayout *headRow = [[ASRowFlowLayout alloc] init];
    headRow.delegate = self;
    headRow.cellSpacing = 10.0;
    headRow.cellWidth = CGRectGetWidth([UIScreen mainScreen].bounds) - 2 * headRow.cellSpacing;

    [rows addObject:headRow];

    ASSectionFlowLayout *section = [[ASSectionFlowLayout alloc] initWithRows:rows];
    section.insetForSection = UIEdgeInsetsMake(headRow.cellSpacing, headRow.cellSpacing, headRow.cellSpacing, headRow.cellSpacing);
    
    return section;
}

- (ASSectionDataSource *)setupBlueSectionDataSource
{
    ASSectionDataSource *src = [[ASSectionDataSource alloc] init];
    src.configureCellBlock = _cellConfigBlock;
    src.cellIdBlock = _cellIdentifierBlock;

    [src addItems:@[[UIColor blueColor], [UIColor blueColor], [UIColor blueColor], [UIColor blueColor], [UIColor blueColor], [UIColor blueColor]]];
    src.name = @"blue";

    return src;
}

- (ASSectionFlowLayout *)setupBlueSectionFlow
{
    NSMutableArray <ASRowFlowLayout *> *rows = [[NSMutableArray alloc] init];

    ASRowFlowLayout *halfRow = [[ASRowFlowLayout alloc] init];
    halfRow.delegate = self;
    halfRow.cellSpacing = 5.0;
    halfRow.cellWidth = CGRectGetWidth([UIScreen mainScreen].bounds) / 2.0 - halfRow.cellSpacing;

    [rows addObject:halfRow];

    ASSectionFlowLayout *section = [[ASSectionFlowLayout alloc] initWithRows:rows];
    section.insetForSection = UIEdgeInsetsMake(0.0, 0.0, 20.0, 0.0);

    return section;
}


- (void)registerCells
{
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([TestCell class])
                                    bundle:nil];

    [self.colView registerNib:cellNib
          forCellWithReuseIdentifier:[TestCell reuseIdentifier]];

}

- (CGFloat)calculatedHeightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onRedButtonSelected:(id)sender
{
    [[self.dataSource sectionByName:@"red"] addItems:@[[UIColor orangeColor]]];
    [self.colView reloadData];
}

- (IBAction)onGreenButtonSelected:(id)sender
{
    [[self.dataSource sectionByName:@"green"] addItems:@[[UIColor cyanColor]]];
    [self.colView reloadData];
}

- (IBAction)onBlueButtonSelected:(id)sender
{
    [[self.dataSource sectionByName:@"blue"] addItems:@[[UIColor magentaColor]]];
    [self.colView reloadData];
}

@end
