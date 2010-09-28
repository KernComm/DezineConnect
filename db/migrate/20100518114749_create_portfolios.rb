class CreatePortfolios < ActiveRecord::Migration
  def self.up
    create_table :portfolios do |t|
      t.string :specialization
      t.string :secondary_specializations_1
      t.string :secondary_specializations_2
      t.string :experience_years
      t.string :experience_months
      t.string :professional_level
      t.string :education
      t.string :awards_won_1
      t.string :awards_won_2
      t.string :awards_won_3
      t.string :awards_won_4
      t.string :awards_won_5
      t.string :availability_1
      t.string :availability_2
      t.string :availability_3
      t.string :availability_4
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :custom_url
      t.string :privacy_settings
      t.string :themes

      t.timestamps
    end
  end

  def self.down
    drop_table :portfolios
  end
end
