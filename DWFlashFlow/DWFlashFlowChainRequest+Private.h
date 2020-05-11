//
//  DWFlashFlowChainRequest+Private.h
//  AFNetworking
//
//  Created by Wicky on 2020/5/8.
//

#import "DWFlashFlowChainRequest.h"

@interface DWFlashFlowChainRequest (Private)

@property (nonatomic ,strong) NSMutableDictionary * responseInfo;

@property (nonatomic ,assign) BOOL successStatus;

@end

@interface DWFlashFlowChainRequest ()

-(void)configRequestWithCurrentRequest:(DWFlashFlowAbstractRequest *)currentRequest;

@end

@interface DWFlashFlowAbstractRequest (Private)

@property (nonatomic ,weak) DWFlashFlowChainRequest * chainRequest;

@end
