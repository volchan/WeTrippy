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
    it "should have an email" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

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

  describe '#first_name' do
    it "should have a first_name" do
      expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
    end

    it '"toto" should be a valid first_name' do
      expect(FactoryGirl.build(:user, first_name: 'toto')).to be_valid
    end
  end

  describe '#last_name' do
    it "should have a last_name" do
      expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
    end

    it '"toto" should be a valid last_name' do
      expect(FactoryGirl.build(:user, last_name: 'toto')).to be_valid
    end
  end

  describe '#birth_date' do
    it 'should have a birth_date' do
      expect(FactoryGirl.build(:user, birth_date: nil)).to_not be_valid
    end

    it 'should have a valid birth_date' do
      expect(FactoryGirl.build(:user, birth_date: Date.new(1989, 12, 16)).birth_date).to eq(Date.new(1989, 12, 16))
    end
  end

  describe '#description'do
    it 'can be blank'  do
      expect(FactoryGirl.build(:user, description: nil)).to be_valid
    end

    describe 'should be greater than 150 character' do
      it '149 character is not valid' do
        expect(FactoryGirl.build(:user, description: "#{'a' * 149}")).to_not be_valid
      end
      it '150 character is valid' do
        expect(FactoryGirl.build(:user, description: "#{'a' * 150}")).to be_valid
      end
      it 'up to 400 character is valid' do
        expect(FactoryGirl.build(:user, description: "#{'a' * 400}")).to be_valid
      end
      it 'more than 400 character is not valid' do
        expect(FactoryGirl.build(:user, description: "#{'a' * 401}")).to_not be_valid
      end
    end
  end
end
