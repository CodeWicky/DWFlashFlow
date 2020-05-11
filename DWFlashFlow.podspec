Pod::Spec.new do |s|
s.name = 'DWFlashFlow'
s.version = '1.1.0'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.summary = '网络请求库，核心基于AFN3.0，实现批量请求、链请求及依赖请求。Network request library, core based on AFN3.0, implements batch request, chain request and dependency request.'
s.homepage = 'https://github.com/CodeWicky/DWFlashFlow'
s.authors = { 'codeWicky' => 'codewicky@163.com' }
s.source = { :git => 'https://github.com/CodeWicky/DWFlashFlow.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = 'DWFlashFlow/**/*.{h,m}'
s.public_header_files = 'DWFlashFlow/**/{DWFlashFlow,DWFlashFlowManager,DWFlashFlowBaseLinker,DWFlashFlowAFNLinker,DWFlashFlowAbstractRequest,DWFlashFlowRequest,DWFlashFlowBatchRequest,DWFlashFlowChainRequest,DWFlashFlowCache}.{h,m}'
s.frameworks = 'UIKit'

end
