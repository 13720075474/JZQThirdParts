//
//  BannerView.m
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/13.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import "BannerView.h"
#import "BannerCollectionViewCell.h"
#define MaxSections  100

@interface BannerView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *mypageControl;
@property (nonatomic, assign) CGSize viewSize;
@property (nonatomic, strong) NSTimer *timer;


@end
@implementation BannerView

- (void)dealloc{
    _imageViews = nil;
    [self removeNSTimer];
    
    
}
- (NSMutableArray *)imageViews{
    
    if (!_imageViews) {
        _imageViews = @[].mutableCopy;
    }
    return _imageViews;
}
- (id)initWithFrame:(CGRect)frame viewSize:(CGSize)viewSize{
    
    self =[super initWithFrame:frame];
    
    if (self) {
        
        self.viewSize = viewSize;
        [self addNSTimer];
        
    }
    return self;
    
}
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(self.viewSize.width, self.viewSize.height);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.viewSize.width, self.viewSize.height) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[BannerCollectionViewCell class] forCellWithReuseIdentifier:@"BannerCollectionViewCell"];
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        [self addSubview:_collectionView];
        _mypageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((self.viewSize.width-100)/2, self.viewSize.height-20-5, 100, 20)];
        _mypageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _mypageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        [self addSubview:_mypageControl];
        
    }
         return _collectionView;
    

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
     return MaxSections;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"BannerCollectionViewCell";
    
    BannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.imageView.image = _items[indexPath.row];
    
    return cell;
    
}
- (void)setItems:(NSArray *)items{
    _items = items;
    if (_items.count<2) {
        self.collectionView.scrollEnabled = NO;
        [self.mypageControl setHidden:YES];
    }else{
        self.collectionView.scrollEnabled = YES;
        [self.mypageControl setHidden:NO];
    }
    [self.collectionView reloadData];
    self.mypageControl.numberOfPages = _items.count;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = (int)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)% _items.count;
    self.mypageControl.currentPage = page;
    
}
-(void)addNSTimer{
    
    _timer =[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)nextPage{
    
    if (_items.count <2) {
        return;
    }
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    NSIndexPath *currentIndexpathSet = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MaxSections / 2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexpathSet atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    NSInteger nextItem = currentIndexpathSet.item +1;
    NSInteger nextSection = currentIndexpathSet.section;
    
    if (nextItem == _items.count) {
        nextItem = 0;
        nextSection ++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
#pragma mark -删除定时器
-(void)removeNSTimer{
    [_timer invalidate];
    _timer =nil;
}

#pragma mark -当用户开始拖拽的时候就调用移除定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self removeNSTimer];
}

#pragma mark -当用户停止拖拽的时候调用添加定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    [self addNSTimer];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)imageViewClick:(void (^)(BannerView *, NSInteger))block{
    
    
    
    
    
    
}
@end
