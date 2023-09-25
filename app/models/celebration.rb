# == Schema Information
#
# Table name: celebrations
#
#  id         :integer          not null, primary key
#  activity   :string
#  date       :date
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :integer
#
class Celebration < ApplicationRecord
  belongs_to(:goal, required: true, class_name: "Goal", foreign_key: "goal_id")
end
