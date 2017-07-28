require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:country)).to be_valid
  end

  it 'has_many users' do
    t = Country.reflect_on_association(:users)
    expect(t.macro).to eq(:has_many)
  end

  describe '#name' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:country, name: nil)).to_not be_valid
    end

    it '"France" is a valid name' do
      expect(FactoryGirl.build(:country, name: 'France')).to be_valid
    end
  end

  describe '#slug' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:country, slug: nil)).to_not be_valid
    end

    it '"FR" is a valid slug' do
      expect(FactoryGirl.build(:country, slug: 'FR')).to be_valid
    end
  end
end
