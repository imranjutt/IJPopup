#
# Be sure to run `pod lib lint IJPopup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IJPopup'
  s.version          = '0.1.2'
  s.summary          = 'A super easy way to add a custom popup to your application'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
If you don't like the look and feel of IOS native alert then use this super easy and customizable popup to add it in your application.
                       DESC

  s.homepage         = 'https://github.com/imranjutt/IJPopup'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'imranjutt' => 'muhammad.imran.jutt@venturedive.com' }
  s.source           = { :git => 'https://github.com/imranjutt/IJPopup.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'IJPopup/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IJPopup' => ['IJPopup/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
