class Todo < ActiveRecord::Base
  attr_accessible :description, :owner_email
  scope :completed, lambda { where("completed_at != NULL") }

  def user=(new_user)
  	self.owner_email = new_user.email
  end
end
