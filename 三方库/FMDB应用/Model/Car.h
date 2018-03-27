//
//  Car.h
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/8.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
/**
 *  所有者
 */
@property(nonatomic, strong) NSNumber *own_id;

/**
 * 车的ID
 */
@property(nonatomic, strong) NSNumber *car_id;
@property(nonatomic,   copy) NSString *brand;
@property(nonatomic, assign) NSInteger price;
@end
