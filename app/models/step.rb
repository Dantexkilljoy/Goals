# == Schema Information
#
# Table name: steps
#
#  id             :integer          not null, primary key
#  name           :string
#  resources      :string
#  skills         :string
#  status         :boolean          default(FALSE)
#  time_allotted  :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  action_plan_id :integer
#
class Step < ApplicationRecord
  belongs_to(:action_plan, required: true, class_name: "ActionPlan", foreign_key: "action_plan_id")
end
