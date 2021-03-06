class String
  def cl_not_empty?
    !self.empty?
  end

  def cl_first
    empty? ? "" : self[0, 1]
  end

  def cl_first_or_nil
    empty? ? nil : self[0, 1]
  end

  def cl_last
    empty? ? "" : self[-1, 1]
  end

  def cl_last_or_nil
    empty? ? nil : self[-1, 1]
  end

  # Retreive the fist n words of a string as a new string.  Attach an optional
  # ellipses what will display smartly
  #
  # Examples
  #    "This is a test".first_words(2)
  #    # => "This is"
  #    "This is a test".first_words(2, ellipses: true)
  #    # => "This is ..."
  #    "This is a test".first_words(2, ellipses: " +++")
  #    # => "This is +++"
  def cl_first_words(n=nil, ellipses: false)
    new_str = n.nil? ? self : split[0...n].join(' ')
    elip = cl_determine_ellipses(new_str, ellipses)
    new_str + "#{elip}"
  end

  private

  def cl_determine_ellipses(str, ellipses)
    return "" if empty? || !ellipses
    return "" if str == self
    ellipses === true ? " ..." : ellipses.to_s
  end
end
