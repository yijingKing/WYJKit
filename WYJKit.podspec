
Pod::Spec.new do |s|
  s.name             = 'WYJKit'
  s.version          = '1.0.2'
  s.summary          = 'WYJKit'
  s.description      = <<-DESC
                            category
                       DESC

  s.homepage         = 'https://github.com/MemoryKing/WYJKit.git'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = 'MIT'
  s.author           = { '╰莪呮想好好宠Nǐつ ' => '1091676312@qq.com' }
  s.source           = { :git => 'https://github.com/MemoryKing/WYJKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.frameworks = 'UIKit','Foundation','AVFoundation'

#s.source_files = 'WYJKit/**/*.{h,m}'

#s.dependency 'DZNEmptyDataSet'
#s.dependency 'MJRefresh'

#s.public_header_files = 'WYJKit/**/*.{h}'



s.subspec 'WYJCategory' do |c|
c.public_header_files = 'WYJKit/WYJCategory/**/*.{h}'
c.source_files = 'WYJKit/WYJCategory/**/*.{h,m}';
end

s.requires_arc = true
end
