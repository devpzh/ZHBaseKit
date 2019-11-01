

#import "BaseCell.h"

@class BaseCollectionViewModel;
@protocol BaseCollectionViewDelegate<NSObject>
@optional

- (void)baseCollectionViewModel:(BaseCollectionViewModel *)model didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)baseCollectionViewScrollViewDidEndDecelerating:(UIScrollView *)scrollView;
@end


@interface BaseCollectionView : BaseCell<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray  *sourceArray;
@property (nonatomic, weak)id<BaseCollectionViewDelegate> baseCollectionViewDelegate;
- (void)reloadData:(NSMutableArray *)array;
- (void)initUI;
@end
