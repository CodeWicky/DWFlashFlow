//
//  DWFlashFlow.h
//  DWFlashFlow
//
//  Created by Wicky on 2018/3/26.
//  Copyright © 2018年 Wicky. All rights reserved.
//

/**
 DWFlashFlow
 数据请求框架
 
 提供Operation行为的请求任务，以及批量请求和链请求的支持。
 提供数据请求的全局配置，但请求对象非单例对象。
 
 version 1.0.0
 Operation行为实现
 普通、批量、链请求实现
 提供核心请求组件更换接口
 提供全局配置管理类
 添加缓存机制
 添加identifier，可以由开发者自行设置。方便在批量请求和链请求中区分数据来源
 
 version 2.0.0
 请求响应数据二次处理改为拦截器模式
 */

#ifndef DWFlashFlow_h
#define DWFlashFlow_h

#import "DWFlashFlowManager.h"
#import "DWFlashFlowBaseLinker.h"
#import "DWFlashFlowAFNLinker.h"
#import "DWFlashFlowAbstractRequest.h"
#import "DWFlashFlowRequest.h"
#import "DWFlashFlowBatchRequest.h"
#import "DWFlashFlowChainRequest.h"


#endif /* DWFlashFlow_h */
