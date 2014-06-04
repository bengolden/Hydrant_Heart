class Assumption < ActiveRecord::Base
  belongs_to :premise, class_name: "Claim"
  belongs_to :argument
end
