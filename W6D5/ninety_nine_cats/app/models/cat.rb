# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  
  COLORS = ['Tabby', 'Black', 'Calico', 'Gold']

  validates :color, inclusion: { in: COLORS }, presence: true
  validates :sex, inclusion: { in: ["M", "F"] }, presence: true
  validates :name, presence: true
  validates :birth_date, presence: true
  

    def age
         age = (Time.now.year - self.birth_date.year)

        if (self.birth_date.month - Time.now.month) < 0
            return age
        elsif (self.birth_date.month - Time.now.month) == 0 && (self.birth_date.day - Time.now.day) <= 0
            return age
        else
            return age - 1
        end                 
    end

    def self.colors
      COLORS
    end
end
