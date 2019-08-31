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
    s.default_subspec = 'AMKTabView'

    # AMKWechatTabViewController 仿微信 左侧的TabViewController
    s.subspec 'AMKWechatTabViewController' do |tabViewController|
        tabViewController.source_files = 'AMKTabView/Classes/AMKWechatTabView/*.{h,m}'
        tabViewController.dependency 'AMKTabView/AMKWechatTabView'
        tabViewController.dependency 'Masonry'
    end

    # AMKWechatTabView 仿微信 左侧的TabView
    s.subspec 'AMKWechatTabView' do |tabView|
        tabView.source_files = 'AMKTabView/Classes/AMKWechatTabView/*.{h,m}'
        tabView.dependency 'AMKTabView/AMKTabView'
        tabView.dependency 'Masonry'
    end

    # AMKTabViewController
    s.subspec 'AMKTabViewController' do |tabViewController|
        tabViewController.source_files = 'AMKTabView/Classes/AMKTabViewController/*.{h,m}'
        tabViewController.dependency 'AMKTabView/AMKTabView'
        tabViewController.dependency 'Masonry'
    end

    # AMKTabView
    s.subspec 'AMKTabView' do |tabView|
        tabView.source_files = 'AMKTabView/Classes/AMKTabView/*.{h,m}'
        tabView.dependency 'AMKCategories/Foundation/NSObject/MethodSwizzling'
        tabView.dependency 'Masonry'
    end
end

