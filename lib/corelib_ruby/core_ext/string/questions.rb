class String
  # Returns true if a non empty string contains all strict space characters.
  # Tabs and new lines are not considered spaces.
  # Returns false for empty strings unless the when_empty: option is set to true.
  def all_spaces?(when_empty: false)
    return when_empty if empty?
    each_byte { |x| return false unless x == 32 }
    true
  end
end
