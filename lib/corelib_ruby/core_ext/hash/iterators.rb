class Hash
  # Tterates over the Array just as you would with Array#each.  However, for each iteration
  # pass in an extra variable that will be `false` until the last iteration.
  def cl_each_with_last_flag
    my_size = size
    index = 1
    each_pair do |key, value|
      yield(key, value, index == my_size)
      index += 1
    end
  end
end
