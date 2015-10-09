class String
  def force_leading_space(even_when_empty: false)
    (return even_when_empty ? " " : "") if empty?
    all_spaces? ? dup : " #{lstrip}"
  end
end
