class RegisteredApplication < ActiveRecord::Base
has_many :events, dependent: :destroy
belongs_to :user

    def event_count
    events.count
    end
end
