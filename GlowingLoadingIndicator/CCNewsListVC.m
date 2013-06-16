//
//  CCGlowingLoadingIndicatorVC.m
//  GlowingLoadingIndicator
//
//  Created by Nia Mutiara on 16/6/13.
//  Copyright (c) 2013 Cat Cyborg. All rights reserved.
//

#import "CCNewsListVC.h"
#import "CCCollectionViewCell.h"
#import "CCCollectionViewFooter.h"
#import "CCNewsItemVC.h"

@interface CCNewsListVC () <UICollectionViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation CCNewsListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CCCollectionViewFooter" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CCCollectionViewFooter"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CCCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CCCollectionViewCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *selectedIndexPaths = [self.collectionView indexPathsForSelectedItems];
    for (NSIndexPath *indexPath in selectedIndexPaths) {
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CCCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionFooter) {
        CCCollectionViewFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CCCollectionViewFooter" forIndexPath:indexPath];
        if (![footer.loadingIndicatorView isAnimating])
            [footer.loadingIndicatorView startAnimating];
        return footer;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(collectionView.frame.size.width, 180);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CCNewsItemVC *viewController = [[CCNewsItemVC alloc] initWithNibName:nil bundle:nil];
    viewController.selectedIndexPath = indexPath;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
