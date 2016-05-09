class Array
  # Returns a hash by popping off the last item if it's a hash, or creating
  # a new empty hash.  This method is useful when a method takes args and
  # the last one can be an optional hash.
  def cl_extract_options!
    last.is_a?(Hash) ? pop : {}
  end

  def cl_not_empty?
    !empty?
  end

  def cl_to_yes_no(options={})
    collect {|e| e.cl_to_yes_no(options)}
  end
end
