class TrueClass
  # Convert true to "Yes".  This method takes the following optional arguments
  #   if_yes: A different string to show other than "Yes"
  def cl_to_yes_no(options={})
    options.fetch(:if_yes, "Yes")
  end

  # Convert true to true.  This method is added for polymorphism with other cl_to_bool methods.
  def cl_to_bool
    self
  end
end
