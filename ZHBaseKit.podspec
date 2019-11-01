#
# Be sure to run `pod lib lint ZHBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHBaseKit'
  s.version          = '0.0.1'
  s.summary          = 'ZHBaseKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                            A framework for data-driven UI and rapid development.
                       DESC

  s.homepage         = 'https://github.com/Panzhenghui/ZHBaseKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PZH' => '1505517260@qq.com' }
  s.source           = { :git => 'https://github.com/Panzhenghui/ZHBaseKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZHBaseKit/Classes/**/*'
  s.requires_arc = true
  
  # s.resource_bundles = {
  #   'ZHBaseKit' => ['ZHBaseKit/Assets/*.png']
  # }


    s.public_header_files = 'ZHBaseKit/Classes/ZHBaseKit/Base.h'
    s.source_files = 'ZHBaseKit/Classes/ZHBaseKit/Base.h'  

  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Masonry'
end
