module ThreadsHelper
  def join_usernames(array)
    users = []
    array.each do |x|
      users << x.username
    end
    return users.uniq.join(", ")
  end
end
