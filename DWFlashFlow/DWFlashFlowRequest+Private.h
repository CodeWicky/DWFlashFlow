//
//  DWFlashFlowRequest+Private.h
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//

#import "DWFlashFlowRequest.h"

@interface DWFlashFlowRequest (Private)

@property (nonatomic ,copy) DWFlashFlowRequestCompletion oriCompletion;

@end

@interface DWFlashFlowRequest ()

-(void)configRequestWithResumeData:(NSData *)resumeData;

-(void)configRequestWithTask:(NSURLSessionTask *)task;

-(void)configRequestWithConfiguration:(DWFlashFlowRequestConfig *)configuration;

@end
