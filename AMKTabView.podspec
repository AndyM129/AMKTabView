#
# Be sure to run `pod lib lint AMKTabView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'AMKTabView'
    s.version          = '0.1.0'
    s.summary          = 'A short description of AMKTabView.'
    s.description      =  <<-DESC
                            TODO: A pod of AMKTabView.
                          DESC
    s.homepage         = 'https://github.com/AndyM129/AMKTabView'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andy Meng' => 'andy_m129@163.com' }
    s.source           = { :git => 'https://github.com/AndyM129/AMKTabView.git', :tag => s.version.to_s }
    s.platform = :osx
    s.osx.deployment_target = "10.10"    
    s.source_files = 'AMKTabView/Classes/*.{h,m}'
    s.public_header_files = 'AMKTabView/Classes/*.h'
end

