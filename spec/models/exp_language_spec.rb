require 'rails_helper'

RSpec.describe ExpLanguage, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.build(:exp_language)).to be_valid
  end

  it 'belongs_to experience' do
    t = ExpLanguage.reflect_on_association(:experience)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'belongs_to language' do
    t = ExpLanguage.reflect_on_association(:language)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#experience' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:exp_language, experience: nil)).to_not be_valid
    end

    it 'should have a valid experience' do
      expect(
        FactoryGirl.build(
          :exp_language,
          experience: FactoryGirl.build(:experience)
        )
      ).to be_valid
    end
  end

  describe '#language' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:exp_language, language: nil)).to_not be_valid
    end

    it 'should have a valid language' do
      expect(
        FactoryGirl.build(
          :exp_language,
          language: FactoryGirl.build(:language)
        )
      ).to be_valid
    end
  end
end
