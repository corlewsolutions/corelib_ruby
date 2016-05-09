class NilClass
  def cl_not_nil?
    false
  end

  def cl_to_yes_no(options={})
    options.fetch(:if_nil, "")
  end
end
