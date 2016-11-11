
Pod::Spec.new do |s|
  s.name         = "LazyKits"
  s.version      = "0.0.1"
  s.summary      = "LazyKits is component Framework"
  s.homepage     = "http://github.com/lazywe/LazyKits"
  s.license      = "MIT"
  s.author       = { "lazywe" => "lazywe@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/lazywe/LazyKits.git", :tag => "#{s.version}" }
  s.source_files  = "LazyKits/*","LazyKits/theme/*"
  s.requires_arc = true
end
