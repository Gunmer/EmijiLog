#
# Be sure to run `pod lib lint EmojiLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EmojiLog'
  s.version          = '3.0.0'
  s.summary          = 'Swift´s framework to write log.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Gunmer/EmojiLog'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gunmer' => 'csosaur@gmail.com' }
  s.source           = { :git => 'https://github.com/Gunmer/EmojiLog.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.3'

  s.source_files = 'EmojiLog/Classes/**/*'
  
end
