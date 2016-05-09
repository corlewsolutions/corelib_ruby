class String
  # Returns true if a non empty string contains all space characters.  Tabs and new lines are not considered spaces.
  # Returns false for empty strings unless the when_empty: option is set to true.
  def cl_all_spaces?(when_empty: false)
    return when_empty if empty?
    each_byte { |x| return false if x != 32 }
    true
  end

  # Returns true if a non empty string contains all digit characters.  Tabs, new lines, line feeds and whitespace
  # all cause the method to return false.
  def cl_all_digits?(if_empty: false)
    return if_empty if empty?
    (self =~ /\A[0-9]+\z/).cl_not_nil?
  end

  # Returns true if a non empty string contains all letters.  Tabs, new lines, line feeds and whitespace
  # all cause the method to return false.
  def cl_all_letters?(if_empty: false)
    return if_empty if empty?
    (self =~ /\A[[:alpha:]]+\z/).cl_not_nil?
  end
end
