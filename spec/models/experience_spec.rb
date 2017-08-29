require 'rails_helper'

RSpec.describe Experience, type: :model do
  Faker::Config.locale = 'fr'

  it 'has a valid factory' do
    expect(FactoryGirl.build(:experience)).to be_valid
  end

  it 'has_many steps' do
    t = Experience.reflect_on_association(:steps)
    expect(t.macro).to eq(:has_many)
  end
  it 'has_many appointments' do
    t = Experience.reflect_on_association(:appointments)
    expect(t.macro).to eq(:has_many)
  end
  it 'has_many exp_languages' do
    t = Experience.reflect_on_association(:exp_languages)
    expect(t.macro).to eq(:has_many)
  end

  it 'belongs_to host' do
    t = Experience.reflect_on_association(:host)
    expect(t.macro).to eq(:belongs_to)
  end
  
  it 'belongs_to category' do
    t = Experience.reflect_on_association(:category)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#host' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, host: nil)).to_not be_valid
    end

    it 'should have a valid host' do
      expect(
        FactoryGirl.build(
          :experience,
          host: FactoryGirl.build(:host)
        )
      ).to be_valid
    end
  end

  describe '#category' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, category: nil)).to_not be_valid
    end

    it 'should have a valid category' do
      expect(
        FactoryGirl.build(
          :experience,
          category: FactoryGirl.build(:category)
        )
      ).to be_valid
    end
  end

  describe '#slots' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, slots: nil)).to_not be_valid
    end

    describe 'should have a valid slots' do
      it 'can\'t be a string' do
        expect(
          FactoryGirl.build(
            :experience,
            slots: 'toto'
          )
        ).to_not be_valid
      end

      it 'should be an integer' do
        expect(
          FactoryGirl.build(
            :experience,
            slots: 10
          )
        ).to be_valid
      end
    end
  end

  describe '#title' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, title: nil)).to_not be_valid
    end

    it 'should have a valid title' do
      expect(
        FactoryGirl.build(
          :experience,
          title: Faker::Book.title
        )
      ).to be_valid
    end
  end

  describe '#description' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, description: nil)).to_not be_valid
    end

    describe 'should have a valid description' do
      it '199 characters is not enough' do
        expect(
          FactoryGirl.build(:experience, description: 'a' * 199)
        ).to_not be_valid
      end

      it '200 characters is enough' do
        expect(
          FactoryGirl.build(:experience, description: 'a' * 200)
        ).to be_valid
      end

      it '800 characters is enough' do
        expect(
          FactoryGirl.build(:experience, description: 'a' * 800)
        ).to be_valid
      end

      it '801 characters is too long' do
        expect(
          FactoryGirl.build(:experience, description: 'a' * 801)
        ).to_not be_valid
      end
    end
  end

  describe 'type' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, type: nil)).to_not be_valid
    end

    it 'should have a valid type' do
      expect(FactoryGirl.build(:experience, type: 1)).to be_valid
    end
  end

  describe 'slogan' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:experience, slogan: nil)).to_not be_valid
    end

    describe 'should have a valid slogan' do
      it '60 characters is enough' do
        expect(FactoryGirl.build(:experience, slogan: 'a' * 60)).to be_valid
      end
      it '61 characters is too long' do
        expect(FactoryGirl.build(:experience, slogan: 'a' * 61)).to_not be_valid
      end
    end
  end
end
