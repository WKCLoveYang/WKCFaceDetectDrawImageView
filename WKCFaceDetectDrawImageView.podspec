Pod::Spec.new do |s|
s.name         = "WKCFaceDetectDrawImageView"
s.version      = "0.0.4"
s.summary      = "人脸特征点打点视图"
s.homepage     = "https://github.com/WKCLoveYang/WKCFaceDetectDrawImageView.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "WKCLoveYang" => "wkcloveyang@gmail.com" }
s.platform     = :ios, "11.0"
s.source       = { :git => "https://github.com/WKCLoveYang/WKCFaceDetectDrawImageView.git", :tag => "0.0.4" }
s.source_files  = "WKCFaceDetectDrawImageView/**/*.{h,m}"
s.public_header_files = "WKCFaceDetectDrawImageView/**/*.h"
s.frameworks = "Foundation", "UIKit"
s.requires_arc = true

end
