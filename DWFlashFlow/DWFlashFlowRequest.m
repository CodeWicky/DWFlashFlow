//
//  DWFlashFlowRequest.m
//  DWFlashFlow
//
//  Created by Wicky on 2017/12/4.
//  Copyright © 2017年 Wicky. All rights reserved.
//

#import "DWFlashFlowRequest.h"
#import "DWFlashFlowManager.h"
#import "DWFlashFlowAbstractRequest+Private.h"

@implementation DWFlashFlowRequest

+(instancetype)requestWithRequest:(DWFlashFlowRequest *)request {
    return [request copy];
}

+(instancetype)requestWithResumeData:(NSData *)resumeData {
    DWFlashFlowRequest * r = [DWFlashFlowRequest new];
    r.requestType = DWFlashFlowRequestTypeDownload;
    [r configRequestWithStatus:DWFlashFlowRequestCanceled];
    [r configRequestWithResumeData:resumeData];
    return r;
}

-(void)startWithCompletion:(DWFlashFlowRequestCompletion)completion {
    if (completion) {
        self.requestCompletion = completion;
    }
    [super start];
}

-(void)startWithProgress:(DWFlahsFlowProgressCallback)progress completion:(DWFlashFlowRequestCompletion)completion {
    if (progress) {
        self.requestProgress = progress;
    }
    if (completion) {
        self.requestCompletion = completion;
    }
    [super start];
}

-(void)cancelByProducingResumeData:(void (^)(NSData *))completionHandler {
    [super cancel];
    [DWFlashFlowManager cancelRequest:self produceResumeData:YES completion:completionHandler];
}

-(void)resume {
    [DWFlashFlowManager resumeRequest:self];
}

-(void)suspend {
    [DWFlashFlowManager suspendRequest:self];
}

#pragma mark --- private ---
-(void)configRequestWithResumeData:(NSData *)resumeData {
    _resumeData = resumeData;
}

-(void)configRequestWithTask:(NSURLSessionDataTask *)task {
    _task = task;
}

-(void)configRequestWithConfiguration:(DWFlashFlowRequestConfig *)configuration {
    _configuration = configuration;
}

#pragma mark --- override ---
-(instancetype)init {
    if (self = [super init]) {
        _useGlobalParameters = YES;
        _useGlobalHeaders = YES;
        _needEncrypt = YES;
        _timeoutInterval = 60;
        _retryCount = 0;
        _retryDelayInterval = 2;
        _useGlobalPreprocessor = YES;
        _useGlobalReprocessing = YES;
        _method = DWFlashFlowMethodGET;
        _requestType = DWFlashFlowRequestTypeNormal;
        _requestSerializerType = DWFlashFlowRequestSerializerTypeJSON;
        _responseSerializerType = DWFlashFlowResponseSerializerTypeJSON;
        _cachePolicy = DWFlashFlowCachePolicyLoadOnly;
        _expiredInterval = 0;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    DWFlashFlowRequest * r = [[[self class] allocWithZone:zone] init];
    [r configRequestWithStatus:self.status];
    r.identifier = self.identifier;
    r.finishAfterComplete = self.finishAfterComplete;
    r.requestCompletion = [self.requestCompletion copy];
    r.apiURL = self.apiURL;
    r.fullURL = self.fullURL;
    r.method = self.method;
    r.requestType = self.requestType;
    r.requestSerializerType = self.requestSerializerType;
    r.responseSerializerType = self.responseSerializerType;
    r.parameters = [self.parameters copy];
    r.useGlobalParameters = self.useGlobalParameters;
    r.headers = [self.headers copy];
    r.useGlobalHeaders = self.useGlobalHeaders;
    r.needEncrypt = self.needEncrypt;
    r.timeoutInterval = self.timeoutInterval;
    r.userName = self.userName;
    r.password = self.password;
    r.retryCount = self.retryCount;
    r.retryDelayInterval = self.retryDelayInterval;
    r.preprocessorBeforeRequest = [self.preprocessorBeforeRequest copy];
    r.useGlobalPreprocessor = self.useGlobalPreprocessor;
    r.reprocessingAfterResponse = [self.reprocessingAfterResponse copy];
    r.useGlobalReprocessing = self.useGlobalReprocessing;
    r.requestProgress = [self.requestProgress copy];
    [r configRequestWithError:[self.error copy]];
    r.destination = [self.destination copy];
    r.downloadSavePath = self.downloadSavePath;
    [r configRequestWithResumeData:[self.resumeData copy]];
    r.files = [self.files copy];
    r.cachePolicy = self.cachePolicy;
    r.expiredInterval = self.expiredInterval;
    return r;
}

-(void)setValue:(id)value forKey:(NSString *)key {
    static NSArray * readonlyKeys = nil;
    if (!readonlyKeys) {
        readonlyKeys = @[@"task",@"resumeData",@"configuration",@"error"];
    }
    if ([readonlyKeys containsObject:key]) {
        NSAssert(NO, @"You can't set %@ for it's only use for framework.",key);
    } else {
        [super setValue:value forKey:key];
    }
}

-(void)start {
    [super start];
}

-(void)main {
    [super main];
    [DWFlashFlowManager sendRequest:self progress:self.requestProgress completion:self.requestCompletion];
}

-(void)cancel {
    [super cancel];
    [DWFlashFlowManager cancelRequest:self];
}

@end

@implementation DWFlashFlowRequestConfig

@end

