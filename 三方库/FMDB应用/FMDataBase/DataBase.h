//
//  DataBase.h
//  MyBasicProject
//
//  Created by 贾子权 on 2017/12/8.
//  Copyright © 2017年 JLSJ.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@class Car;

@interface DataBase : NSObject

@property(nonatomic, strong) Person *person;

+ (instancetype)sharedDataBase;
#pragma mark - Person
/**
 *  添加person
 *
 */
- (void)addPerson:(Person *)person;

/**
 *删除person
 *
 */
- (void)deletePerson:(Person *)person;

/**
 *更新person
 *
 *
 */
- (void)updatePerson:(Person *)person;

/**
 *获取所有数据
 *
 */
- (NSMutableArray *)getAllPerson;

#pragma mark - Car

/**
 *  给person添加车辆
 *
 */
- (void)addCar:(Car *)car toPerson:(Person *)person;

/**
 * 给person删除车辆
 *
 */
- (void)deleteCar:(Car *)car fromPerson:(Person *)person;


- (NSMutableArray *)getAllCarsFromPerson:(Person *)person;


/**
 *删除person的所有车辆
 *
 */
- (void)deleteAllCarsFromPerson:(Person *)person;


@end
