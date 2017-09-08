require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it 'belongs_to user' do
    t = Comment.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'belongs_to experience' do
    t = Comment.reflect_on_association(:experience)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#user' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:comment, user: nil)).to_not be_valid
    end

    it 'should have a valid user' do
      expect(FactoryGirl.build(:comment, user: FactoryGirl.build(:user))).to be_valid
    end

    it 'can\'t be the host of the experience' do
      experience = FactoryGirl.build(:experience)
      expect(FactoryGirl.build(:comment, user: experience.host,experience: experience)).to_not be_valid
    end
  end

  describe '#experience' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:comment, experience: nil)).to_not be_valid
    end

    it 'should have a valid experience' do
      expect(
        FactoryGirl.build(
          :comment,
          experience: FactoryGirl.build(:experience)
        )
      ).to be_valid
    end
  end

  describe '#rating' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:comment, rating: nil)).to_not be_valid
    end

    describe 'must be between 0 and 5 and be an integer' do
      it '0 should be valid' do
        expect(FactoryGirl.build(:comment, rating: 0)).to be_valid
      end

      it '5 should be valid' do
        expect(
          FactoryGirl.build(:comment, rating: 5)).to be_valid
      end

      it '2.5 should be valid' do
        expect(
          FactoryGirl.build(:comment, rating: 2.5)).to be_valid
      end

      it '6 shouldn\'t be valid' do
        expect(FactoryGirl.build(:comment, rating: 6)).to_not be_valid
      end

      it '"toto" shouldn\'t be valid' do
        expect(FactoryGirl.build(:comment, rating: 'toto')).to_not be_valid
      end
    end
  end

  describe '#comment' do
    it 'can be blank' do
      expect(FactoryGirl.build(:comment, comment: nil)).to be_valid
    end

    describe 'must have at least 250 characters' do
      it '200 characters is not enough' do
        expect(FactoryGirl.build(:comment, comment: 'a' * 200)).to_not be_valid
      end

      it '250 characters is enough' do
        expect(FactoryGirl.build(:comment, comment: 'a' * 250)).to be_valid
      end

      it '500 characters is enough' do
        expect(FactoryGirl.build(:comment, comment: 'a' * 500)).to be_valid
      end
    end
  end
end
