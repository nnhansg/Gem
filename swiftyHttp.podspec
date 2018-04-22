Pod::Spec.new do |s|
  s.name         = "SwiftyHttp"
  s.version      = "0.0.1"
  s.summary      = "An extreme light weight system with high performance for managing all api calls in app with closure"
  s.homepage     = "https://github.com/Albinzr/SwiftyHttp"
  s.license      = 'MIT'
  s.author       = { "Albin CR" => "albinzr@gmail.com" }
  s.source       = { :git => "hhttps://github.com/Albinzr/SwiftyHttp.git", :tag => "#{s.version}" }

  s.requires_arc = true
  s.platform     = :ios, '8.0'

  s.source_files  = "SwiftyHttp", "SwiftyHttp/**/*.swift"
  
end