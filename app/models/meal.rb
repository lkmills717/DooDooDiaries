class Meal < ApplicationRecord
    belongs_to :user
    include PgSearch::Model
    pg_search_scope :search_by_description,
      against: [ :description, :created_at ],
      using: {
          tsearch: { prefix: true}
      }

    def sortable_date
      created_at.to_datetime
    end
end
