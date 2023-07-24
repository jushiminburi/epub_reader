#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint epub_reader.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'epub_reader'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'


  s.dependency 'Flutter'
  s.dependency 'DTCoreText', :configurations => :debug
  s.dependency 'IRHexColor', '~> 0.0.5'
  s.dependency 'AEXML', '~> 4.5.0'
  s.dependency 'SSZipArchive', '~> 2.2.2'
  s.dependency 'FMDB', '~> 2.7.5'
  s.dependency 'SnapKit', '~> 5.0.1'
  s.dependency 'PKHUD', '~> 5.3.0'
  s.dependency 'CMPopTipView', '~> 2.3.2'

  s.ios.deployment_target = '11.0'
end
