//
//  DWFlashFlowManager.h
//  DWFlashFlow
//
//  Created by Wicky on 2017/12/4.
//  Copyright © 2017年 Wicky. All rights reserved.
//

/**
    DWFlashFlowManager
    DWFlashFlowRequest的管理类。
    可以配置全局参数、统一开始、暂停、取消等操作。
    并且实际为请求消息的整合及转发者。
    接收到request对象后将转发给Linker对象。再由Linker对象负责对接请求框架
 
    version 1.0.0
    基本支持普通请求，请求链，批量请求功能
    支持请求数据缓存
    支持NSOperationQueue协同调用
    支持底层请求核心定制
 
    version 2.0.0
    请求响应数据二次处理改为拦截器模式
 */

#import <Foundation/Foundation.h>
#import "DWFlashFlowAbstractRequest.h"
#import "DWFlashFlowBaseLinker.h"
#import "DWFlashFlowCache.h"

@protocol DWFlashFlowEncryptProtocol

@required
///加密
-(id)encrypt:(id)info;
///解密
-(id)decrypt:(id)info;
@end

UIKIT_EXTERN const NSInteger CacheOnlyButNoCache;
UIKIT_EXTERN const NSInteger RequestCanceled;
UIKIT_EXTERN const NSInteger NeitherRegisterLinkerClassNorIncludeAFN;
UIKIT_EXTERN const NSInteger BatchRequestFail;
UIKIT_EXTERN const NSInteger ChainReuqestFail;

@interface DWFlashFlowManager : NSObject

//Request linker for manager.
///DWFlashFlowManager 与实际请求核心的链接器。
@property (nonatomic ,strong ,readonly) DWFlashFlowBaseLinker * linker;

//Global headers of all request.
///全局请求头
@property (nonatomic ,strong) NSDictionary * globalHeaders;

//Global parameters of all request.
///全局参数
@property (nonatomic ,strong) NSDictionary * globalParameters;

//Global preprocessor of all request.
///全局预处理
@property (nonatomic ,copy) DWFlashFlowProcessorBlock globalPreprocessor;

//Global interceptor of all request.
///全局拦截器
@property (nonatomic ,copy) DWFlashFlowResponseInterceptor globalInterceptor;

//Base URL for request.Use together with apiURL of request.
///根URL。与请求对象的apiURL配合使用。
@property (nonatomic ,copy) NSString * baseURL;

///Setup by developer to describe current appVersion.
///当前应用版本号，由开发者自行设置。
@property (nonatomic ,assign) NSInteger appVersion;

//Global expired time interval for response cache.
///全局响应缓存过期时间
@property (nonatomic ,assign) NSTimeInterval globalExpiredInterval;

//Encryptor for request.
///加密器
@property (nonatomic ,strong) id<DWFlashFlowEncryptProtocol> encryptor;

//An instance follows DWFlashFlowCacheProtocol who handle response cache.
///遵循DWFlashFlowCacheProtocol协议的处理响应缓存的实例
@property (nonatomic ,strong) id<DWFlashFlowCacheProtocol> cacheHandler;

//Singleton method.
///实例化方法
+(instancetype)manager;

//Regist the class of linker.DWFlashFlowAFNLinker by default, and DWFlashFlowAFNLinker will be available only when has include DWNetworkAFNManager.
///注册Linker的实例类，若不注册，则默认使用DWFlashFlowAFNLinker。DWFlashFlowAFNLinker根据是否引入DWNetworkAFNManager自动决定有效性。
+(BOOL)registerRequestLinkerClass:(Class)linkerClass;

//Send a request.
///发送请求
+(void)sendRequest:(__kindof DWFlashFlowAbstractRequest *)request completion:(DWFlashFlowRequestCompletion)completion;
+(void)sendRequest:(__kindof DWFlashFlowAbstractRequest *)request progress:(DWFlahsFlowProgressCallback)progress completion:(DWFlashFlowRequestCompletion)completion;

//Suspend a request.
///挂起请求
+(void)suspendRequest:(__kindof DWFlashFlowAbstractRequest *)request;
+(void)suspendAll;

//Resume a request.
///恢复请求
+(void)resumeRequest:(__kindof DWFlashFlowAbstractRequest *)request;
+(void)resumeAll;

//Cancel a request.
///取消请求
+(void)cancelRequest:(__kindof DWFlashFlowAbstractRequest *)request;
+(void)cancelRequest:(__kindof DWFlashFlowAbstractRequest *)reqeust produceResumeData:(BOOL)produce completion:(void(^)(NSData *resumeData))completion;
+(void)cancelAll;

//Fetch request by ID.
///通过ID取出请求对象
+(__kindof DWFlashFlowAbstractRequest *)requestForID:(NSString *)requestID;

@end
