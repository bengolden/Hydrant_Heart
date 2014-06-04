class Argument < ActiveRecord::Base
  has_many :assumptions
  belongs_to :author, class_name: "User"

end
