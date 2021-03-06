class Hash
  # This method mimics the fetch method except it also deletes the key from the
  # hash once it has been fetched.
  #
  # If key exists in the hash, it's value will be returned.
  # If key doesn't exist, and optional default value will be returned
  # If key doesn't exist and no default is specified, a KeyError is raised
  # If key doesn't exists, there is no default, but a block is given, then
  # that block will be executed with the key.
  def cl_extract(*args)
    arg_length = args.length
    fail ArgumentError, "wrong number of arguments #{arg_length} for 1..2" if arg_length == 0 || arg_length > 2
    key = args[0]

    # Just return the value if the key exists.
    return delete(key) if key?(key)

    # The key doesn't exist.  If the user gave us a block, yield to it and return the value from the block.
    return yield key if block_given?
    (args.length == 2) ? args[1] : fail(KeyError, "key not found #{key.inspect}", caller)
  end
end
