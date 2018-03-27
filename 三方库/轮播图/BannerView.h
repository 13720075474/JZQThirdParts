//
//  BannerView.h
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/13.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BannerView : UIView

- (id)initWithFrame:(CGRect)frame viewSize:(CGSize)viewSize;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic,copy)void(^imageViewClickBlock)(BannerView *bannerView, NSInteger index);
//点击图片
- (void)imageViewClick:(void(^)(BannerView *bannerView,NSInteger index))block;
@end
