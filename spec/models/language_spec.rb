require 'rails_helper'

RSpec.describe Language, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:language)).to be_valid
  end

  describe '#name' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:language, name: nil)).to_not be_valid
    end

    it '"French" is a valid name' do
      expect(FactoryGirl.build(:language, name: 'French')).to be_valid
    end
  end
end
