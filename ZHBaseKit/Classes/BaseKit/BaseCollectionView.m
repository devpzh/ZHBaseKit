

#import "BaseCollectionView.h"
#import "BaseCollectionViewModel.h"
#import "UICollectionView+BaseCell.h"
#import "Base.h"

@implementation BaseCollectionView
{
    UIView *_bottomSeparatorView;
    
}

-(void)onLoad
{
    [self initUI];
}

- (void)initUI
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _bottomSeparatorView = [[UIView alloc]init];
    _bottomSeparatorView.backgroundColor = [UIColor clearColor];
    _bottomSeparatorView.hidden = NO;
    [self addSubview:_bottomSeparatorView];
    [_bottomSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).offset(kPadding);
        make.right.equalTo(self).offset(-kPadding);
        make.height.equalTo(@0.5);
    }];
    
}

- (void)updateScrollDirection:(UICollectionViewScrollDirection) direction
{
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    if (layout.scrollDirection != direction)
    {
        layout.scrollDirection = direction;
    }
    
}

- (void)dataDidChanged
{
    if (!self.data) return;
    
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    self.baseCollectionViewDelegate = model.baseCollectionViewDelegate;
    [self updateScrollDirection:model.scrollDirection];
    if (model.openOffsetMemoryFunction)
    {
        self.collectionView.contentOffset = model.contentOffset;
    }
    self.collectionView.pagingEnabled = model.pagingEnabled;
    self.backgroundColor = model.backgroundColor;
    self.collectionView.showsHorizontalScrollIndicator = model.showsHorizontalScrollIndicator;
    self.collectionView.showsVerticalScrollIndicator = model.showsVerticalScrollIndicator;
    self.collectionView.scrollEnabled = model.scrollEnabled;
    
    if (model.showBottomSeparatorView)
    {
        _bottomSeparatorView.hidden = NO;
    }else
    {
        _bottomSeparatorView.hidden = YES;
    }
    
    [self reloadData:model.sourceArray];
    
}



- (void)reloadData:(NSMutableArray *)array;
{
    self.sourceArray = array;
    [self.collectionView reloadData];
}


#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCellModel* model = [self.sourceArray objectAtIndex:indexPath.row];
    return CGSizeMake(model.cellWidth, model.cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    return model.edgeInset;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    return model.minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    return model.minimumInteritemSpacing;
}

#pragma mark UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    [collectionView.collectionViewLayout invalidateLayout];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.sourceArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseCellModel* model = [self.sourceArray objectAtIndex:indexPath.row];
    UICollectionViewCell* cell = [UICollectionView adCollectionView:collectionView cellForItemAtIndexPath:indexPath model:model];
    BaseCell* contentView = (BaseCell*)[cell.contentView viewWithTag:kyjCellContentTag];
    contentView.frame = CGRectMake(0, 0, model.cellWidth, model.cellHeight);
    contentView.data = model;
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    if(self.baseCollectionViewDelegate && [self.baseCollectionViewDelegate respondsToSelector:@selector(baseCollectionViewModel:didSelectItemAtIndexPath:)])
    {
        [self.baseCollectionViewDelegate baseCollectionViewModel:model didSelectItemAtIndexPath:indexPath];
    }
    

}

#pragma mark - UIScrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
    model.contentOffset = scrollView.contentOffset;
    if(self.baseCollectionViewDelegate && [self.baseCollectionViewDelegate respondsToSelector:@selector(baseCollectionViewScrollViewDidEndDecelerating:)])
    {
        [self.baseCollectionViewDelegate baseCollectionViewScrollViewDidEndDecelerating:scrollView];
    }
    
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        BaseCollectionViewModel *model = (BaseCollectionViewModel *)self.data;
        model.contentOffset = scrollView.contentOffset;
    }
    
}


#pragma mark --- Lazy Loading
- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_collectionView];
    }
    return _collectionView;
}


- (NSMutableArray *)sourceArray
{
    if (!_sourceArray)
    {
        _sourceArray = [[NSMutableArray alloc] init];
    }
    return _sourceArray;
}




@end
