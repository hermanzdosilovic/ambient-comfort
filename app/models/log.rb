class Log < ApplicationRecord
    validates :created_at, presence: true
end
