
Pod::Spec.new do |s|
  s.name         = "SignificantSpices"
  s.version      = "0.15.12"
  s.summary      = "An ensemble of extensions to Swift and Foundation that are commonly used in resmio's iOS Apps."
  s.description  = <<-DESC
    This framework contains extensions to Swift (Operators, extensions to native types, missing functions, &ct.)
    and Foundation that are commonly used in resmio's iOS Applications and Frameworks.
  DESC

  s.homepage     = "https://github.com/resmio/SignificantSpices"
  s.license      = "MIT"
  s.author       = { "Jan Nash" => "jan@resmio.com" }

  s.swift_version = '5.8'
  s.ios.deployment_target = "12.0"

  s.source       = { 
    :git => "https://github.com/resmio/SignificantSpices.git", 
    :tag => "v#{s.version}" 
  }

  s.subspec 'SwiftExtensions' do |swiftext|
    swiftext.source_files = 'SignificantSpices/Sources/SwiftExtensions/**/*.{swift}'
  end

  s.subspec 'ObjectiveCExtensions' do |objcext|
    objcext.source_files = 'SignificantSpices/Sources/ObjectiveCExtensions/**/*.{swift}'
  end

  # s.subspec 'FoundationExtensions' do |foundationext|
  #   foundationext.source_files = 'SignificantSpices/Sources/FoundationExtensions/**/*.{swift}'
  # end
end
