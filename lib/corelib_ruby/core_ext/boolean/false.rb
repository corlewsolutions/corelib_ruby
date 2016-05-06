class FalseClass
  # Convert false to "No".  This method takes the following optional arguments
  #   if_no: A different string to show other than "No"
  def co_to_yes_no(options={})
    options.fetch(:if_no, "No")
  end
end
