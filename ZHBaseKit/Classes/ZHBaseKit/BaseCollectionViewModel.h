


#import "BaseCellModel.h"
#import "BaseCollectionView.h"

@interface BaseCollectionViewModel : BaseCellModel<NSCopying>

@property (nonatomic,assign) CGFloat minimumLineSpacing;
@property (nonatomic,assign) CGFloat minimumInteritemSpacing;

@property (nonatomic,assign) UIEdgeInsets edgeInset;
@property (nonatomic,strong) NSMutableArray <BaseCellModel *>*sourceArray;

///< default is UICollectionViewScrollDirectionHorizontal
@property (nonatomic,assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic,assign) CGPoint contentOffset;
@property (nonatomic, weak)  id<BaseCollectionViewDelegate> baseCollectionViewDelegate;

///< 使view复用时保持原来位置（warning：view带上下拉刷新功能时必须关闭）
@property (nonatomic,assign)BOOL   pagingEnabled;

///< 是否开启contentOffset记忆功能 默认关闭
@property (nonatomic,assign)BOOL   openOffsetMemoryFunction;

///< default YES.
@property(nonatomic,assign) BOOL   showsHorizontalScrollIndicator;

@property(nonatomic,assign) BOOL   showsVerticalScrollIndicator;

@property(nonatomic,assign) BOOL  scrollEnabled;
@property(nonatomic,assign) BOOL  showBottomSeparatorView;

@property(nonatomic,strong) UIColor *backgroundColor;

@end
