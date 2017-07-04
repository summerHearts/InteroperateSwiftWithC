//
//  traditional_oc.h
//  InteroperateSwiftWithC
//
//  Created by Kenvin on 2017/7/4.
//  Copyright © 2017年 Kenvin. All rights reserved.
//

#ifndef traditional_oc_h
#define traditional_oc_h

#import <Foundation/Foundation.h>

//导入基本类型的全局变量
const int global_ten;

//NS_STRING_ENUM修饰的类型，通常表示某个范围里，值固定的类型
typedef NSString * TrafficLightColor NS_STRING_ENUM;

TrafficLightColor const TrafficLightColorRed;
TrafficLightColor const TrafficLightColorYellow;
TrafficLightColor const TrafficLightColorGreen;


//如果一个类型的值有可能扩展，我们可以使用NS_EXTENSIBLE_STRING_ENUM来修饰它
typedef int Shape NS_EXTENSIBLE_STRING_ENUM;

Shape const ShapeCircle;
Shape const ShapeTriangle;
Shape const ShapeSquare;

#endif

