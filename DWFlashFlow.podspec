Pod::Spec.new do |s|
s.name = 'DWFlashFlow'
s.version = '2.0.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = '网络请求库，任意替换请求核心，提供默认请求核心，实现批量请求、链请求及依赖请求。Network request library, replace request core as you need easily, provide default request core, implements batch request, chain request and dependency request.'
s.homepage = 'https://github.com/CodeWicky/DWFlashFlow'
s.authors = { 'codeWicky' => 'codewicky@163.com' }
s.source = { :git => 'https://github.com/CodeWicky/DWFlashFlow.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = 'DWFlashFlow/**/{DWFlashFlow,DWFlashFlowManager,DWFlashFlowBaseLinker,DWFlashFlowAFNLinker,DWFlashFlowAbstractRequest,DWFlashFlowRequest,DWFlashFlowBatchRequest,DWFlashFlowChainRequest,DWFlashFlowCache}.{h,m}'
s.frameworks = 'UIKit'

end
