class Numeric
  def co_to_yes_no(options={})
    (self == 1 || self == 1.0).co_to_yes_no(options)
  end
end
