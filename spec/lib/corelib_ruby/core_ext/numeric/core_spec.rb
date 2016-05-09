class Numeric
  def cl_to_yes_no(options={})
    (self == 1 || self == 1.0).cl_to_yes_no(options)
  end
end
