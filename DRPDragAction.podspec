Pod::Spec.new do |s|
  s.name         = 'LARSAdController'
  s.version      = '3.0.0'
  s.summary      = 'Lightweight ad mediation for iOS'
  s.author = {
    'Lars Anderson' => 'youremail@here.com'
  }
  s.source = {
    :git => 'https://github.com/mbanasiewicz/DRPDragDrop.git',
    :tag => '3.0.0'
  }
  s.source_files = 'Source/*.{h,m}'
  s.dependency     'pop'
end