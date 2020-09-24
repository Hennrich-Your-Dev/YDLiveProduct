Pod::Spec.new do |spec|

  spec.name         = "YDLiveProduct"
  spec.version      = "1.0.2"
  spec.summary      = "Product for B2W."
  spec.homepage     = "https://yourdev.com.br"
  spec.license      = "MIT"
  spec.author       = { "Douglas Hennrich" => "douglashennrich@yourdev.com.br" }

  spec.platform     = :ios, "11.0"

  spec.source           = { :git => "https://github.com/Hennrich-Your-Dev/YDLiveProduct.git", :tag => spec.version }
  spec.source_files     = "YDLiveProduct/**/*.{h,m,swift,xib}"
  spec.resources        = ["YDLiveProduct/Assets.xcassets"]
  spec.resource_bundles = { "YDLiveProduct" => ["YDLiveProduct/Assets.xcassets/*"] }
  spec.swift_version    = "5.0"

  spec.dependency       'Alamofire', '4.9.1'
  spec.dependency       'Cosmos', '22.1.0'

end
