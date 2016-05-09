class String
  #Returns the subset of a string from [0, position] if string[position] is a space.
  #If string[max] is not a space, it is assumed we are in the middle of a word.
  #and the logic will increase position a little bit to not break in the middle of a word.
  def cl_excerpt_to_end_of_word(position=nil)
    return self if position.nil? or position >= self.size

    char = self[position]
    return self[0, position].rstrip if char == " "

    self[0, cl_index_of_next_space_from(position)].rstrip
  end

  #Given a position, return the position of the next space
  def cl_index_of_next_space(position=0)
    return nil if self.empty? or position.nil?
    return nil if position >= self.size

    idx = position
    (self.size - position).times do
      idx = idx + 1
      return idx if self[idx] == " "
    end
    idx
  end
end
