#
# Be sure to run `pod lib lint SSSwiftUIGIFView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSSwiftUIGIFView'
  s.version          = '2.0.0'
  s.platform         = :ios
  s.platform         = :osx
  s.summary          = 'SSSwiftUIGIFView is a custom controller which helps to load GIF in SwiftUI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'SSSwiftUIGIFView is a custom controller designed to help load GIFs in SwiftUI. It supports loading GIFs from remote URLs, is compatible with both iOS and macOS, and implements a caching mechanism to improve loading times and reduce data usage. Additionally, it provides both a default progress view and support for custom progress views while loading the GIF.'
                       DESC

  s.homepage         = 'https://github.com/simformsolutions/SSSwiftUIGIFView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vatsal Tanna' => 'vatsal.t@simformsolutions.com' }
  s.source           = { :git => 'https://github.com/simformsolutions/SSSwiftUIGIFView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  s.osx.deployment_target = '13.0'
  s.swift_version = '5.0'


  s.source_files = 'Source/**/*.swift'

end
