//
//  BannerCollectionViewCell.m
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/13.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import "BannerCollectionViewCell.h"

@implementation BannerCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(zero, zero, frame.size.width, frame.size.height)];
        
        [self addSubview:_imageView];
        
    }
    return self;
}
@end
