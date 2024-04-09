#
# Be sure to run `pod lib lint MisticaSwiftUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'MisticaSwiftUI'
    s.version          = '29.7.3'
    s.summary          = 'Mistica is an iOS framework that contains reusable UI components and utilities for the Telefonica group.'
    s.description      = <<-DESC
    Mistica is an iOS framework that contains reusable UI components and utilities for the Telefonica group.
                         DESC
  
    s.homepage         = 'https://github.com/Telefonica/mistica-ios'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Novum' => 'cto-ios@telefonica.com' }
    s.source           = { :git => 'https://github.com/Telefonica/mistica-ios/mistica-ios.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '12.0'
  
    s.source_files = 'Sources/MisticaSwiftUI/**/*.swift', 'Sources/MisticaCommon/**/*.swift'
    s.exclude_files = 'Sources/MisticaSwiftUI/Export.swift'
    s.resources = ['Sources/MisticaCommon/Resources/*']
    s.frameworks = 'SwiftUI'
    
    s.dependency "lottie-ios", "4.4.1"
    # s.dependency "SnapshotTesting", "1.8.2"
    s.dependency "SDWebImage", "5.19.1"
    s.dependency "SDWebImageSVGCoder", "1.7.0"
  end