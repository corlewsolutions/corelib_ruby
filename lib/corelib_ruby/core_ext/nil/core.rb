class NilClass
  # A simple helper to improve readability.
  # [].cl_not_nil?    reads better than    ![].nil?
  def cl_not_nil?
    false
  end

  def cl_to_yes_no(options={})
    options.fetch(:if_nil, "")
  end

  # See the documenation for String#cl_combine.  This method exists so we can seamlessly call nil.cl_combine("foo") and get back
  # "foo" (instead of an error).
  def cl_combine(*args)
    "".cl_combine(*args)
  end
end
