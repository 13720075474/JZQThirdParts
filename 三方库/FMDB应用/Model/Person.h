//
//  Person.h
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/8.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, strong) NSNumber *ID;
@property(nonatomic,   copy) NSString *name;
@property(nonatomic, assign) NSInteger age;
@property(nonatomic, assign) NSInteger number;


/**
 *  一个人可以拥有多辆车
 */
@property(nonatomic, strong) NSMutableArray *carArray;


@end


