
class Show < ActiveRecord::Base
    scope :shows_by_alphabetical_order, -> {order(:name)}
    scope :ratings_more_than_x, ->(x) {where("rating >= #{x}")}
    def self.highest_rating
        maximum(:rating)
    end
    binding.pry
    def self.most_popular_show
        where("rating = ?", highest_rating).first 
    end

    def self.lowest_rating
        minimum(:rating)
    end

    def self.least_popular_show
        where("rating = #{lowest_rating}")[0]
    end

    def self.ratings_sum
        sum(:rating)
    end

    def self.popular_shows
        where("rating >= 5")
    end

    # def self.shows_by_alphabetical_order
    #     order(:name)
    # end
end
Show.ratings_more_than_x(3)
# Show.maximum(:rating)
# Show.maximum(:rating)
# Show.minimum(:rating)
# Show.minimum(:rating)
# Show.sum(:rating)
# Show.where("rating = 5", 5)
# Show.order(:name)