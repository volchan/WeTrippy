require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:appointment)).to be_valid
  end

  it 'belongs_to user' do
    t = Appointment.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'belongs_to experience' do
    t = Appointment.reflect_on_association(:experience)
    expect(t.macro).to eq(:belongs_to)
  end

  describe '#user' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:appointment, user: nil)).to_not be_valid
    end

    it 'should have a valid user' do
      expect(FactoryGirl.build(:appointment, user: FactoryGirl.build(:user))).to be_valid
    end
  end

  describe '#experience' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:appointment, experience: nil)).to_not be_valid
    end

    it 'should have a valid experience' do
      expect(FactoryGirl.build(:appointment, experience: FactoryGirl.build(:experience))).to be_valid
    end
  end
end
