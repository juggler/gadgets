class GadgetSearch
  def initialize(user)
    @user = user
  end

  def perform(name)
    @user.gadgets.where('name LIKE ?', "%#{name}%")
  end
end
