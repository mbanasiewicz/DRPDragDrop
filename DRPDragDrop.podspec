Pod::Spec.new do |s|
  s.name         = 'DRPDragDrop'
  s.version      = '0.1.0'
  s.summary      = 'Simple drag and drop lib'
  s.platform     =  :ios, "7.0"
  s.requires_arc = true
  s.author = {
    'Maciej Banasiewicz' => 'mbanasiewicz@gmail.com'
  }
  s.source = {
    :git => 'https://github.com/mbanasiewicz/DRPDragDrop.git',
    :tag => '0.0.1'
  }
  s.source_files = 'Source/*.{h,m}'
  s.dependency     'pop'
end