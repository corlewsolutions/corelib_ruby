class String
  def cl_to_yes_no(options={})
    self.cl_to_bool(options).cl_to_yes_no(options)
  end

  def cl_force_leading_space(even_when_empty: false)
    (return even_when_empty ? " " : "") if empty?
    cl_all_spaces? ? dup : " #{lstrip}"
  end

  #true will always be returned if we can clearly match one of the true cases
  #In unstrict mode, the string is assumed false if we cannot match true
  #In strict mode, the string must clearly match a false condition to return false
  #otherise an error is raised
  def cl_to_bool(options={})
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

  #Does the same thing as String#contact, but allows a separator to be inserted between the
  #two strings.
  def cl_concat_with(str, separator="")
    return self if str.nil? || str.empty?
    return self.concat(str) if self.empty?
    self.concat(separator) unless separator.empty?
    self.concat(str)
  end

  # Combines two strings together with a separator.
  def cl_combine(*args)
    options = args.cl_extract_options!
    raise ArgumentError, "You need to supply at least one string" if args.empty?
    str = self
    args.each { |val| str = str.cl_private_combine(val, options) }

    return options.fetch(:if_empty, "") if str.nil? || str.empty?

    prefix = options.fetch(:prefix, nil)
    str = "#{prefix}#{str}"  if options.fetch(:wrap, true) && (prefix.cl_not_nil?)
    suffix = options.fetch(:suffix, nil)
    str = "#{str}#{suffix}" if options.fetch(:wrap, true) && (suffix.cl_not_nil?)
    str
  end

  protected

  def cl_private_combine(str, options={})
    strip = options.fetch(:strip, true)
    (return strip ? self.strip : self.dup) if str.nil? or str.empty?
    (return strip ? str.strip : str.dup) if self.empty?
    separator = options.fetch(:separator, " ")

    if strip
      pre = self.strip
      post = str.strip
    else
      pre = self.dup
      post = str.dup
    end

    return pre + post if separator.empty?

    # TODO - Support other separators other than spaces.  For instance if someone wanted to join with a comma
    # and pre ended with a comma, we could have an option to disallow repeating
    pre + separator + post
  end

end
