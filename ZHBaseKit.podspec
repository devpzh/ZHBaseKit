#
# Be sure to run `pod lib lint ZHBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZHBaseKit'
  s.version          = '1.0.0'
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
  s.source           = { :git => 'https://github.com/Panzhenghui/ZHBaseKit.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

   s.requires_arc = true
  
  # s.resource_bundles = {
  #   'ZHBaseKit' => ['ZHBaseKit/Assets/*.png']
  # }

    s.source_files = 'ZHBaseKit/Classes/**/*.{h,m}'

    s.public_header_files = 'ZHBaseKit/Classes/ZHBaseKit/*.h'
   
    
    s.frameworks = ['UIKit', 'Foundation','AVFoundation']
    s.dependency 'Masonry'
end
