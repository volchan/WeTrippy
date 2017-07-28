require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'should belongs_to country' do
    t = User.reflect_on_association(:country)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#email' do
    it '"toto@toto.fr" should be a valid email' do
      expect(FactoryGirl.build(:user, email: 'toto@toto.fr')).to be_valid
    end

    it '"123" shouldn\'t be a valid email' do
      expect(FactoryGirl.build(:user, email: '123')).to_not be_valid
    end
  end

  describe '#password' do
    it 'should have a password' do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

    it '"RR33!" should not be valid' do
      expect(FactoryGirl.build(:user, password: 'RR33!')).to_not be_valid
    end

    it '"ruby rules 33" should not be valid' do
      expect(FactoryGirl.build(:user, password: 'ruby rules 33')).to_not be_valid
    end

    it '"RubyRules 33!" should be valid' do
      expect(FactoryGirl.build(:user, password: 'RubyRules 33!')).to be_valid
    end
  end
end
