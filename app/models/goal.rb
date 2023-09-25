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
end
