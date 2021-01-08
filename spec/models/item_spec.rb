require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'associations' do
    it { should belong_to(:catalog) }
    it { should belong_to(:category)}
  end

  describe 'validations' do
      it { should validate_length_of(:name).is_at_least(3) }
      it { should validate_numericality_of(:price).is_greater_than(0) }
      it { should validate_length_of(:description).is_at_least(6) }
      it {should validate_inclusion_of(:status).in_array(["active", "inactive"])}
  end


end
