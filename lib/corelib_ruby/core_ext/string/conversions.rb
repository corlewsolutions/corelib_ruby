class String
  def co_force_leading_space(even_when_empty: false)
    (return even_when_empty ? " " : "") if empty?
    co_all_spaces? ? dup : " #{lstrip}"
  end
end
