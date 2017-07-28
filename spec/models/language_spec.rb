require 'rails_helper'

RSpec.describe Language, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:language)).to be_valid
  end

  it 'has_many user_languages' do
    t = Language.reflect_on_association(:user_languages)
    expect(t.macro).to eq(:has_many)
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
