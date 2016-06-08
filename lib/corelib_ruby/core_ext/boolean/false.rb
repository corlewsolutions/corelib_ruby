class FalseClass
  # Convert false to "No".  This method takes the following optional arguments
  #   if_no: A different string to show other than "No"
  def cl_to_yes_no(options={})
    options.fetch(:if_no, "No")
  end

  # Convert false to false.  This method is added for polymorphism with other cl_to_bool methods.
  def cl_to_bool
    self
  end
end
