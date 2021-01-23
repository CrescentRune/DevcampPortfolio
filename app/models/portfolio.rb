class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :subtitle, :main_image, :thumb_image


    # Custom scoping with instance method
    def self.angular
        where(subtitle: "Angular")
    end

    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

end
