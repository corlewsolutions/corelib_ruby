class String
  def co_to_yes_no(options={})
    self.co_to_bool(options).co_to_yes_no(options)
  end

  def co_force_leading_space(even_when_empty: false)
    (return even_when_empty ? " " : "") if empty?
    co_all_spaces? ? dup : " #{lstrip}"
  end

  #true will always be returned if we can clearly match one of the true cases
  #In unstrict mode, the string is assumed false if we cannot match true
  #In strict mode, the string must clearly match a false condition to return false
  #otherise an error is raised
  def co_to_bool(options={})
    strip = options.fetch(:strip, true)
    strict = options.fetch(:strict, false)
    str = strip ? self.strip : self
    return true if str =~ /\A(true|t|yes|y|1)\Z/i

    if strict
      return false if str.empty? || str =~ /\A(false|f|no|n|0)\Z/i
      raise ArgumentError.new("cannot convert \"#{str}\" to boolean")
    end

    false
  end
end
