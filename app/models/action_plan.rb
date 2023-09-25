# == Schema Information
#
# Table name: action_plans
#
#  id         :integer          not null, primary key
#  date       :date
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :integer
#
class ActionPlan < ApplicationRecord
  belongs_to(:goal, required: true, class_name: "Goal", foreign_key: "goal_id")
  has_many(:steps, class_name: "Step", foreign_key: "action_plan_id", dependent: :destroy)
end
