class Array
  # Deletes items from the array, but raises an error if the item does not exist.
  #
  # obj: the obj to delete
  def cl_delete!(obj)
    # do this check first only if the obj is nil because the
    # cost of include? rises linerarly with the size of the array
    raise ArgumentError if obj.nil? && !include?(nil)
    result = self.delete(obj)
    raise ArgumentError.new("#{obj.inspect} not present in array") if result.nil? && !obj.nil?
    result
  end
end
