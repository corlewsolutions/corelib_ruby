require "corelib_ruby/version"
require "corelib_ruby/core_ext/nil/base"
require "corelib_ruby/core_ext/object/base"
require "corelib_ruby/core_ext/boolean/base"
require "corelib_ruby/core_ext/numeric/base"
require "corelib_ruby/core_ext/string/base"
require "corelib_ruby/core_ext/hash/base"
require "corelib_ruby/core_ext/array/base"

# Setup pry for development when running "rake console". Guard against load
# errors in production (since pry is only loaded as a DEVELOPMENT dependency
# in the .gemspec)
begin
  require "pry"
rescue LoadError
end

module CorelibRuby
  def self.prepare
    [NilClass, Object, Array, String, FalseClass, TrueClass, Hash, Numeric].each do |class_name|
      alias_methods_for_core_class(class_name)
    end
  end

  # Alias any method starting with 'cl_' to a similiar method starting with '_'.
  def self.alias_methods_for_core_class(class_name)
    method_names = class_name.instance_methods.select {|m| m.to_s.start_with?("cl_") }
    method_names.each do |method_name|
      new_name = method_name.to_s
      new_name.slice!(0, 3)
      new_name = "_#{new_name}".to_sym
      class_name.send(:alias_method, new_name, method_name)
    end
  end

end

CorelibRuby.prepare
