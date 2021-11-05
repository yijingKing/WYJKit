
Pod::Spec.new do |s|
  s.name             = 'WYJKit'
  s.version          = '2.1.0'
  s.summary          = 'WYJKit'
  s.description      = <<-DESC
                            add nav
                       DESC

  s.homepage         = 'https://github.com/MemoryKing/WYJKit.git'
  #s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.license          = 'MIT'
  s.author           = { '╰莪呮想好好宠Nǐつ ' => '1091676312@qq.com' }
  s.source           = { :git => 'https://github.com/MemoryKing/WYJKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.frameworks = 'UIKit','Foundation'

s.dependency 'Masonry'
s.dependency 'IQKeyboardManager'

s.public_header_files   = 'WYJKit/WYJKitHeader.{h}'
s.source_files = 'WYJKit/WYJKitHeader.{h}'

s.subspec 'Header' do |h|
h.public_header_files   = 'WYJKit/Header/*.{h}'
h.source_files = 'WYJKit/Header/*.{h,m}'
end
s.subspec 'Macro' do |h|
h.public_header_files   = 'WYJKit/Macro/*.{h}'
h.source_files = 'WYJKit/Macro/*.{h,m}'
end
s.subspec 'WYJCategory' do |c|
c.public_header_files   = 'WYJKit/WYJCategory/**/**/*.{h}'
c.source_files   = 'WYJKit/WYJCategory/**/**/*.{h,m}'
end
s.subspec 'WYJBaseEmpty' do |e|
e.public_header_files   = 'WYJKit/WYJBaseEmpty/**/**/*.{h}'
e.source_files          = 'WYJKit/WYJBaseEmpty/**/**/*.{h,m}'
e.dependency 'DZNEmptyDataSet'
e.dependency 'MJRefresh'
end

s.requires_arc = true
end

