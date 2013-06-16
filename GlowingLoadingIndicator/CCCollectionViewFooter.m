//
//  CCCollectionViewFooter.m
//  GlowingLoadingIndicator
//
//  Created by Nia Mutiara on 16/6/13.
//  Copyright (c) 2013 Cat Cyborg. All rights reserved.
//

#import "CCCollectionViewFooter.h"

@interface CCCollectionViewFooter ()
@property (nonatomic) BOOL loadingIndicatorViewSetup;
@end

@implementation CCCollectionViewFooter

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    [self setupLoadingIndicatorView];
}

- (void)setupLoadingIndicatorView {
    if (self.loadingIndicatorViewSetup) return;

    self.loadingIndicatorViewSetup = YES;
    self.loadingIndicatorView.animationImages =
    @[
      [UIImage imageNamed:@"Frame-1"],
      [UIImage imageNamed:@"Frame-2"],
      [UIImage imageNamed:@"Frame-3"],
      [UIImage imageNamed:@"Frame-4"],
      [UIImage imageNamed:@"Frame-5"],
      [UIImage imageNamed:@"Frame-6"],
      [UIImage imageNamed:@"Frame-1"],
      [UIImage imageNamed:@"Frame-6"],
      [UIImage imageNamed:@"Frame-5"],
      [UIImage imageNamed:@"Frame-4"],
      [UIImage imageNamed:@"Frame-3"],
      [UIImage imageNamed:@"Frame-2"]
      ];
    self.loadingIndicatorView.animationDuration = 1.2;
    [self.loadingIndicatorView startAnimating];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
