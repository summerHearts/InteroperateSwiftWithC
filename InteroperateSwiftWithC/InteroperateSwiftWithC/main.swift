//
//  main.swift
//  InteroperateSwiftWithC
//
//  Created by Kenvin on 2017/7/4.
//  Copyright © 2017年 Kenvin. All rights reserved.
//

import Foundation

let ten = global_ten


/*
 对于用NS_STRING_ENUM修饰的TrafficLightColor，引入到Swift就会变成一个类似这样的struct：
 
 struct TrafficLightColor: RawRepresentable {
      typealias RawValue = String
 
      init(rawValue: RawValue)
      var rawValue: RawValue { get }
 
      static var red: TrafficLightColor { get }
      static var yellow: TrafficLightColor { get }
      static var green: TrafficLightColor { get }
 }
 这个转换规则是这样的：
 
 根据NS_STRING_ENUM修饰的类型决定导入到Swift时struct的名字，因此，导入的类型名称就是TrafficLightColor；
 去掉和类型名称相同的公共前缀，并把剩余部分首字母小写后，变成struct的type property；
 
 */

let redColor: TrafficLightColor = .red
let redColorRawValue = redColor.rawValue // Red


//这样，按照之前的逻辑，类型Shape在Swift中会被导入成一个struct，它和TrafficLight唯一不同的地方在于，多了一个可以省略参数的init方法，使得我们可以在Swift里，这样扩展Shape的值：

extension Shape {
    static var ellipse: Shape {
        return Shape(4)
    }
}

let e: Shape = .ellipse

//当然，这并不是说使用NS_STRING_ENUM导入的类型就不可以扩展，例如，我们也可以在Swift里，这样扩展TrafficLightColor：

extension TrafficLightColor {
    static var blue: TrafficLightColor {
        return TrafficLightColor(rawValue: "Blue")
    }
}

//从语法上来说，这没有任何问题。因此，NS_STRING_ENUM和NS_EXTENSIBLE_STRING_ENUM并不是什么语言层面上的限制，而只是语义上的差别。面对这种差别，Swift为NS_EXTENSIBLE_STRING_ENUM提供了更为方便的扩展方法罢了。
