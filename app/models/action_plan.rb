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
end
