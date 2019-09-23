class Play < ActiveRecord::Base
    validates :formation, presence: true
    validates :name, presence: true
    validates :setup, presence: true

    belongs_to :user
end
