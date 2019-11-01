


#import "BaseCollectionViewModel.h"
@implementation BaseCollectionViewModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.cellClassName = @"BaseCollectionView";
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.backgroundColor = [UIColor clearColor];
        self.scrollEnabled = YES;
        self.showBottomSeparatorView = NO;
    }
    return self;
}


- (NSMutableArray *)sourceArray
{
    if (!_sourceArray)
    {
        _sourceArray = [[NSMutableArray alloc] init];
    }
    return _sourceArray;
}


#pragma mark - copy delegate
- (instancetype)copyWithZone:(NSZone *)zone
{
    BaseCollectionViewModel *copy = [[self class] allocWithZone:zone];
    copy.minimumLineSpacing = self.minimumLineSpacing;
    copy.minimumInteritemSpacing = self.minimumInteritemSpacing;
    copy.cellWidth = self.cellWidth;
    copy.cellHeight = self.cellHeight;
    copy.cellClassName = [self.cellClassName copy];
    copy.contentOffset = self.contentOffset;
    copy.scrollDirection = self.scrollDirection;
    copy.edgeInset = self.edgeInset;
    copy.sourceArray = [self.sourceArray copy];
   
    
    return copy;
}


@end
