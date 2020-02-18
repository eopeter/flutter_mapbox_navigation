#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_mapbox_navigation'
  s.version          = '0.0.10'
  s.summary          = 'Add Turn By Turn Navigation to Your Flutter Application Using MapBox'
  s.description      = <<-DESC
Add Turn By Turn Navigation to Your Flutter Application Using MapBox
                       DESC
  s.homepage         = 'http://dormmom.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Dorm Mom, Inc.' => 'eopeter@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'MapboxNavigation', '~> 0.38.0'

  s.ios.deployment_target = '10.0'
end

