require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:category)).to be_valid
  end

  it 'has_many experiences' do
    t = Category.reflect_on_association(:experiences)
    expect(t.macro).to eq(:has_many)
  end

  describe '#name' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:category, name: nil)).to_not be_valid
    end

    it '"art of living" is a valid name' do
      expect(FactoryGirl.build(:category, name: 'art of living')).to be_valid
    end
  end
end
