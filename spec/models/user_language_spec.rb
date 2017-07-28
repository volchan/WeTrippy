require 'rails_helper'
require 'pry-byebug'

RSpec.describe UserLanguage, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user_language)).to be_valid
  end

  it 'belongs_to user' do
    t = UserLanguage.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'belongs_to language' do
    t = UserLanguage.reflect_on_association(:language)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#user_id' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:user_language, user_id: nil)).to_not be_valid
    end

    it 'should reference a user' do
      expect(FactoryGirl.build(:user_language, user_id: FactoryGirl.build(:user))).to_not be_valid
    end
  end

  describe '#language_id' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:user_language, language_id: nil)).to_not be_valid
    end

    it 'should reference a language' do
      expect(FactoryGirl.build(:user_language, language_id: FactoryGirl.build(:language))).to_not be_valid
    end
  end
end
