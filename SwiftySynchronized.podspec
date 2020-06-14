Pod::Spec.new do |spec|

  spec.name         = "SwiftySynchronized"
  spec.version      = "0.0.1"
  spec.summary      = "A Swift generic wrapper type to help enforce thread-safe usage of stored properties."

  spec.description  = <<-DESC 
  A Swift generic wrapper type to help enforce thread-safe usage of stored properties.
                   DESC

  spec.homepage     = "https://github.com/nik3212/SwiftySynchronized"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Nikita Vasilev" => "nv3212@gmail.com" }

  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/nik3212/SwiftySynchronized.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources", "Sources/**/*.{h,m,swift}"
  spec.exclude_files = "Sources/*.plist"
end
