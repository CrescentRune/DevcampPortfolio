class AddSubtitleToPortfolios < ActiveRecord::Migration[6.1]
  def change
    add_column :portfolios, :subtitle, :string
  end
end
