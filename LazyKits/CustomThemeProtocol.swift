//
//  CustomThemeProtocol.swift
//  Pods
//
//  Created by apple on 2016/11/8.
//
//

import UIKit

// 容器作用域
struct Bounds{
    var x:CGFloat
    var y:CGFloat
    var width:CGFloat
    var height:CGFloat
    var radius:CGFloat?
}

// 容器作用域
struct Size{
    var width:CGFloat
    var height:CGFloat
}

//坐标
struct Point{
    var x:CGFloat
    var y:CGFloat
}

// 颜色 背景颜色
struct LazyColor{
    var color:UIColor
    var background:UIColor
}

// 配置
struct LazyOption{
    var fontsize:CGFloat
    var color:LazyColor
    var point:Point?
    var size:Size?
}

//
// 动态模版类型
//
protocol CustomTheme {
    
    init()
    /****************************颜色区************************/
    // 模版遮罩背景颜色
    var maskBackground:UIColor { get }
    // alert白净颜色
    var alertBackground:UIColor { get }
    //默认颜色
    var ButtonColor:LazyColor { get }
    //确认按钮背景颜色
    var confirmButtonColor:LazyColor { get }
    //顶部关闭按钮样式
    var closeButtonColor:LazyColor { get }

    
    /****************************容器区************************/
    // 容器作用域
    var mainBounds:Bounds { get }
    // alert作用域
    var alertBounds:Bounds { get }
    //头部信息
    var titleOption:LazyOption{ get }
    //内容信息
    var infoOption:LazyOption{ get }
    
    
    /****************************按钮区************************/
    //默认按钮
    var ButtonBounds:Bounds { get }
    //顶部确认按钮
    var confirmButtonBounds:Bounds { get }
    //顶部关闭按钮
    var closeButtonBounds:Bounds { get }
    //取消按钮
    var cancelButtonBounds:Bounds { get }
    
    
}
