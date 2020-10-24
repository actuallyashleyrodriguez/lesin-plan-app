class Lesson < ActiveRecord::Base
    belongs_to :user

    validates :label, :description, :subject, :grade, :image_url, presence: true
end