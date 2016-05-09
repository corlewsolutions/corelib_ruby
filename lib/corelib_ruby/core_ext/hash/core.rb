class Hash
  # A simple helper to improve readability.
  # [].cl_not_empty?    reads better than    ![].empty?
  def cl_not_empty?
    !empty?
  end
end
