//
//  LazyKit.swift
//  Pods
//
//  Created by apple on 2016/11/8.
//
//
import UIKit

protocol LazyKits {
    static var Prompt:LazyPrompt { get }
}

//
// 项目的入口
//
public class Lazy:LazyKits{
    
    // 弹出窗口
    public static var Prompt: LazyPrompt {
        get{
            return LazyPrompt.getInstance
        }
    }
}
