class Array
  # Many methods take an optional hash argument to hold options for the method.  This method pops that hash off he arguments
  # list if it exists or returns an empty hash.
  def cl_extract_options!
    last.is_a?(Hash) ? pop : {}
  end

  # A simple helper to improve readability.
  # [].cl_not_empty?    reads better than    ![].empty?
  def cl_not_empty?
    !empty?
  end

  def cl_to_yes_no(options={})
    collect {|e| e.cl_to_yes_no(options)}
  end
end
