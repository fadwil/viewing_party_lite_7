require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
  end
end
