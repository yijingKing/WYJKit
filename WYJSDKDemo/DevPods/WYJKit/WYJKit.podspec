
Pod::Spec.new do |s|
  s.name             = 'WYJKit'
  s.version          = '5.2.4'
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
s.platform     = :ios, '13.0'
  s.frameworks = 'UIKit','Foundation','CoreGraphics','CoreText'

s.dependency 'Masonry'
s.dependency 'DZNEmptyDataSet'
s.dependency 'MJRefresh'
s.dependency 'SDWebImage'
s.dependency 'IQKeyboardManager'
s.dependency 'TZImagePickerController'
s.dependency 'LSTPopView'
s.dependency 'SVProgressHUD'

s.public_header_files   = 'WYJKit/**/*.{h}'
s.source_files = 'WYJKit/**/*.{h,m}'

#s.subspec 'Macro' do |h|
#h.public_header_files   = 'WYJKit/Macro/*'
#h.source_files = 'WYJKit/Macro/*'
#end

#s.subspec 'WYJCategory' do |c|
#c.public_header_files   = 'WYJKit/WYJCategory/**/**/*.{h}'
#c.source_files   = 'WYJKit/WYJCategory/**/**/*.{h,m}'
#end

#s.subspec 'WYJBase' do |e|
#e.public_header_files   = 'WYJKit/WYJBase/**/**/*.{h}'
#e.source_files          = 'WYJKit/WYJBase/**/**/*.{h,m}'
#e.dependency 'DZNEmptyDataSet'
#e.dependency 'MJRefresh'
#end

s.requires_arc = true

s.module_name      = 'WYJKit'
s.pod_target_xcconfig = {
  'DEFINES_MODULE' => 'YES'
}

end

