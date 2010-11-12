# see also 
# http://kenai.com/projects/jruby/pages/CallingJavaFromJRuby/revisions/47
# http://blogs.sun.com/coolstuff/entry/using_java_classes_in_jruby

# demo_spec.rb
require 'java'

target_dir = "target/classes"
$CLASSPATH << target_dir 

def add_classes_from_dir dir
  Dir[dir + "/**/*.class"].each do |clazz| 
    import clazz[dir.length+1..clazz.length-'.class'.length-1].gsub('/', '.')
  end
end

#require 'demo'

# 1.
# import_class Java::demo.Demo
# 
# # 2.
# import Java::demo.Demo

# 3.
#import "demo.Demo"

# 4.
add_classes_from_dir target_dir

describe Demo do
  before :each do
    @demo = Demo.new    
  end
  
  it "returns hello world string" do
    @demo.message.should == "Hello World!"
  end
end
