//
//  ZDCardCollectionFlowLayout.m
//  ZFProgresssViewDemo
//
//  Created by W z on 2019/3/1.
//  Copyright © 2019 wzf. All rights reserved.
//

#import "ZDCardCollectionFlowLayout.h"
static CGFloat kActivityDistance = 400;
static CGFloat kScaleFactor = 0.3;
@implementation ZDCardCollectionFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    CGFloat horizontalCenterX = proposedContentOffset.x + (self.collectionView.frame.size.width/2.);
    NSArray *attriArray = [super layoutAttributesForElementsInRect:targetRect];
    CGFloat offsetAjustment = CGFLOAT_MAX;
    
    NSIndexPath *indexPath = nil;
    for (UICollectionViewLayoutAttributes *attributes in attriArray) {
        CGFloat itemHorizontalCenterX = attributes.center.x;
        if (ABS(itemHorizontalCenterX - horizontalCenterX ) < ABS(offsetAjustment)) {
            offsetAjustment = itemHorizontalCenterX - horizontalCenterX;
            indexPath = attributes.indexPath;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAjustment, proposedContentOffset.y);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect = self.collectionView.frame;
    visibleRect.origin = self.collectionView.contentOffset;
    
    for (UICollectionViewLayoutAttributes *attributes in arr) {
        CGFloat distance = (visibleRect.origin.x +visibleRect.size.width/2.) - attributes.center.x;
        CGFloat normalzedDistance = ABS(distance/kActivityDistance);
        CGFloat zoom  = 1 - kScaleFactor*normalzedDistance;
        attributes.transform = CGAffineTransformMakeScale(zoom, zoom);
    }
    return arr;
}

@end
