class Hash
  # A simple helper to improve readability.
  # [].cl_not_empty?    reads better than    ![].empty?
  def cl_not_empty?
    !empty?
  end

  # Add an key value if the key doesn't already exist.  It will return the
  # currently set value if the key exists, or the new value if the key doesn't exist.
  def cl_add_if_absent(key, value)
    current = self[key]
    current.nil? ? (self[key] = value) : current
  end

  # Update a key's value if the key exists.  It will return the new value if an update was made, or
  # nil if the key doesn't exist.
  def cl_update_if_present(key, value)
    current = self[key]
    current.nil? ? nil : (self[key] = value)
  end

  # This method works similiar to fetch, however it handles the case where a key is already present
  # in the hash, but has a value of nil.  This method will return the default instead of returning the nil.
  def cl_fetch_ignoring_nil(key, default)
    val = fetch(key, default)
    val.nil? ? default : val
  end
end
