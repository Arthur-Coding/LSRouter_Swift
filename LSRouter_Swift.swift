//
//  LSRouter_Swift.swift
//  LSRouter_Swift
//
//  Created by ArthurShuai on 2018/2/5.
//  Copyright © 2018年 ArthurShuai. All rights reserved.
//

import Foundation

public typealias LSRouterHandler = (AnyObject)->Void
public typealias LSInformationHandler = (Any)->Void

/// 远程App调用入口
///
/// - Parameters:
///   - url: 格式：scheme://[target]/[actionName]?[params]
///          例如：aaa://targetA/actionB?id=1234&key=4567
///   - completion: 完成回调
public func performAction(url:URL, completion:LSRouterHandler?)
{
    LSRouter.performAction(url: url, completion: completion)
}

/// 本地组件调用入口
///
/// - Parameters:
///   - objectClass: 组件类名
///   - actionName: 待执行方法名，组件的方法名前必须添加前缀@objc
///   - params: 待执行方法的参数
///   - perform: 找到组件后下一步调用处理，如push、present组件等
public func openModule(objectClass:String, actionName:String?, params:Any?, perform:LSRouterHandler?)
{
    LSRouter.openModule(objectClass: objectClass, actionName: actionName, params: params, perform: perform)
}

/// 释放组件
///
/// - Parameter objectClass: 组件类名
/// - Returns: YES or NO
public func releaseModule(objectClass:String) -> Bool
{
    return LSRouter.releaseModule(objectClass: objectClass)
}

/// 组件发送通讯信息接口
/// * 发送方只负责通过通讯标记发送信息
///
/// - Parameters:
///   - information: 通讯信息
///   - tagName: 通讯标记，用于接收方识别接收信息
public func sendInformation(information:Any, tagName:String)
{
    LSRouter.sendInformation(information: information, tagName: tagName)
}

/// 组件接收通讯信息接口
/// * 接收方只负责通过通讯标记接收信息
///
/// - Parameters:
///   - tagName: 通讯标记，用于接收方识别接收信息
///   - result: 接收到通讯信息回调，将返回通讯信息
public func receiveInformation(tagName:String, result:@escaping LSInformationHandler)
{
    LSRouter.receiveInformation(tagName: tagName, result: result)
}
