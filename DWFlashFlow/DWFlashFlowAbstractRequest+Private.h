//
//  DWFlashFlowAbstractRequest+Private.h
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//
#import "DWFlashFlowAbstractRequest.h"

@interface DWFlashFlowAbstractRequest ()

/**
 Indicates this operation has been finished.
 
 标志着任务结束。
 */
-(void)finishOperation;

/**
 Config the request with status.
 
 为请求对象配置状态。
 */
-(void)configRequestWithStatus:(DWFlashFlowRequestStatus)status;

/**
Config the request with response.

为请求对象配置响应数据。
*/
-(void)configRequestWithResponse:(id)response;

/**
Config the request with error.

为请求对象配置错误信息。
*/
-(void)configRequestWithError:(NSError *)error;

@end


