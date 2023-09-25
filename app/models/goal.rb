# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  date       :date
#  name       :string
#  priorities :string
#  progress   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Goal < ApplicationRecord
  belongs_to(:user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true)
  has_many(:action_plans, class_name: "ActionPlan", foreign_key: "goal_id", dependent: :destroy)
  has_many(:celebrations, class_name: "Celebration", foreign_key: "goal_id", dependent: :destroy)
end
