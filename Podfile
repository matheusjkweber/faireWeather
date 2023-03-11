platform :ios, '10.0'

target 'faireWeather' do
    pod 'RIBs', :git => 'https://github.com/uber/RIBs.git'
    pod 'SnapKit', '~> 5.6.0'


  target 'faireWeatherTests' do
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts target.name
  end
end
