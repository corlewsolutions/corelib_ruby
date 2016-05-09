class Hash
  #This method iterates over the Array as normal #each method.  For each iteration
  #set two variables in the block, |item, flag|. item will be set tot he current item
  #in the iteration; flag will be set to "false" on all iterations except the last iteration
  def cl_each_with_last_flag
    my_size = size
    index = 1
    each_pair do |key, value|
      yield(key, value, index == my_size)
      index += 1
    end
  end
end
