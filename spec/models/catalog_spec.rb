require 'rails_helper'

RSpec.describe Catalog, type: :model do

  describe 'associations' do
    it { should belong_to(:company) }
    it { should have_many(:items)}
  end

describe 'validations' do
    it { should validate_length_of(:name).is_at_least(3) }
    it {should validate_inclusion_of(:status).in_array(["active", "inactive"])}
end

end
