//
//  DWFlashFlowChainRequest+Private.m
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//

#import "DWFlashFlowChainRequest+Private.h"
#import <objc/runtime.h>


@implementation DWFlashFlowChainRequest (Private)

-(NSMutableDictionary *)responseInfo {
    NSMutableDictionary * r = objc_getAssociatedObject(self, _cmd);
    if (!r) {
        r = @{}.mutableCopy;
        self.responseInfo = r;
    }
    return r;
}

-(void)setResponseInfo:(id)responseInfo {
    objc_setAssociatedObject(self, @selector(responseInfo), responseInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)successStatus {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setSuccessStatus:(BOOL)successStatus {
    objc_setAssociatedObject(self, @selector(successStatus), @(successStatus), OBJC_ASSOCIATION_ASSIGN);
}

@end

@implementation DWFlashFlowAbstractRequest (Private)

-(DWFlashFlowChainRequest *)chainRequest {
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setChainRequest:(DWFlashFlowChainRequest *)chainRequest {
    objc_setAssociatedObject(self, @selector(chainRequest), chainRequest, OBJC_ASSOCIATION_ASSIGN);
}

@end
