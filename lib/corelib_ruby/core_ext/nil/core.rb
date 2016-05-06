class NilClass
  def co_not_nil?
    false
  end

  def co_to_yes_no(options={})
    options.fetch(:if_nil, "")
  end
end
