Pod::Spec.new do |spec|
  spec.name                     = 'XcodeCoverage'
  spec.summary                  = 'Code coverage for Xcode projects'
  spec.version                  = '1.0.0'
  spec.platform                 = :ios
  spec.ios.deployment_target    = '6.0'
  spec.authors                  = {'Jon Reid' => 'jon@qualitycoding.org'}
  spec.homepage                 = 'https://github.com/jonreid/XcodeCoverage'
  spec.license                  = 'MIT'
  spec.source                   = {:git => 'https://github.com/jonreid/XcodeCoverage.git', :tag => "#{spec.version}"}
  
  #these files will be brought into the filesystem, but not added to your .xcodeproj. 
  spec.preserve_paths           = 'cleancov', 'getcov', 'llvm-cov-wrapper.sh', 'envcov.sh', 'lcov-1.11/*', 'exportenv.sh', 'run_code_coverage_post.sh'
  
  spec.requires_arc             = true
end