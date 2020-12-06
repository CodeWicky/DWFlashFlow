//
//  DWFlashFlowBatchRequest+Private.m
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//

#import "DWFlashFlowBatchRequest+Private.h"
#import <objc/runtime.h>

@implementation DWFlashFlowBatchRequest (Private)

-(BOOL)successStatus {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setSuccessStatus:(BOOL)successStatus {
    objc_setAssociatedObject(self, @selector(successStatus), @(successStatus), OBJC_ASSOCIATION_ASSIGN);
}

@end
