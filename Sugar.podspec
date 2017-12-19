Pod::Spec.new do |s|
  s.name         = "Sugar"
  s.version      = "0.1.0"
  s.summary      = "Elegant Syntactic Sugar For Swift"
  s.description  = <<-DESC
Sugar 🍯 is a thin light weight framweork  that provides you with Elegant Syntactic Sugar For Swift which will:
1.clean up your codebase and make it easier to read 📖
2.Easily Intialize objects 🛠
3.Throw away Guard Statements with Unwrap 🎫
  DESC
  s.homepage     = " https://github.com/chrisbkarani/Sugar"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Chris Karani" => "chrisbkarani@gmail.com" }
  s.social_media_url   = "https://twitter.com/cbkarani"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/chrisbkarani/Sugar.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation", "CoreGraphics"
end
