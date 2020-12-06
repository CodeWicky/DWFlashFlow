//
//  DWFlashFlowRequest+Private.m
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//

#import "DWFlashFlowRequest+Private.h"
#import <objc/runtime.h>

@implementation DWFlashFlowRequest (Private)

-(DWFlashFlowRequestCompletion)oriCompletion {
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setOriCompletion:(DWFlashFlowRequestCompletion)oriCompletion {
    objc_setAssociatedObject(self, @selector(oriCompletion), oriCompletion, OBJC_ASSOCIATION_COPY);
}

@end
