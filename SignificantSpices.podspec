
Pod::Spec.new do |s|
  s.name         = "SignificantSpices"
  s.version      = "0.0.1"
  s.summary      = "An ensemble of extensions to Swift and Foundation that are commonly used in resmio's iOS Apps."
  s.description  = <<-DESC
    This framework contains extensions to Swift (Operators, extensions to native types, missing functions, &ct.)
    and Foundation that are commonly used in resmio's iOS Applications and Frameworks.
  DESC

  s.homepage     = "https://github.com/resmio/SignificantSpices"
  s.license      = "MIT"
  s.author       = { "Jan Nash" => "jan@resmio.com" }

  s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { 
    :git => "https://github.com/resmio/SignificantSpices.git", 
    :tag => "v#{s.version}" 
  }

  s.subspec 'Swift' do |swift|
    swift.source_files = 'SignificantSpices/Sources/Swift/**/*.{swift}'
  end

  s.subspec 'Foundation' do |foundation|
    foundation.source_files = 'SignificantSpices/Sources/Foundation/**/*.{swift}'
  end
end
