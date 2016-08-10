require 'texstyles/style'
module Texstyles
  @@root  = File.expand_path('../..',  __FILE__)

  class << self
    def root
      @@root
    end

    def list
      Dir.glob(File.join(@@root, 'styles', "*.tex.erb")).map{|path| File.basename(path,'.tex.erb')}
    end

    def categories
     { 'generic' => "Default",
       'physics' => "Physics & Astronomy",
       'computers' => "CS/Engineering",
       'bio' => "Life Sciences",
       'geo' => "Earth Sciences",
       'other' => "Misc",
       'grants' => "Grant Proposals",
       'thesis' => "University Thesis"
     }
    end
  end
end