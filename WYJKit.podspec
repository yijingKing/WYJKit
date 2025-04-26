
Pod::Spec.new do |s|
  s.name             = 'WYJKit'
  s.version          = '5.2.2'
  s.summary          = 'WYJKit'
  s.description      = <<-DESC
                            add nav
                       DESC

  s.homepage         = 'https://github.com/MemoryKing/WYJKit.git'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = 'MIT'
  s.author           = { '╰莪呮想好好宠Nǐつ ' => '1091676312@qq.com' }
  s.source           = { :git => 'https://github.com/MemoryKing/WYJKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.frameworks = 'UIKit','Foundation','CoreGraphics','CoreText'
s.swift_version = '5.0'
s.dependency 'Masonry'
s.dependency 'DZNEmptyDataSet'
s.dependency 'MJRefresh'
s.dependency 'SDWebImage'
s.dependency 'IQKeyboardManager'
s.dependency 'TZImagePickerController'
s.dependency 'LSTPopView'
s.public_header_files   = 'WYJKit/**/*.{h}'
s.source_files = 'WYJKit/**/*.{h,m}'

s.requires_arc = true
end

