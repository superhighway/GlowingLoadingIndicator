//
//  CCNewsItemCollectionViewCell.m
//  GlowingLoadingIndicator
//
//  Created by Nia Mutiara on 16/6/13.
//  Copyright (c) 2013 Cat Cyborg. All rights reserved.
//

#import "CCNewsItemCollectionViewCell.h"

@implementation CCNewsItemCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height + 200);
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, 320, 10) animated:NO];
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
