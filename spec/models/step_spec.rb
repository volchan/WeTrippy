require 'rails_helper'

RSpec.describe Step, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.build(:step)).to be_valid
  end

  describe '#country' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, country: nil)).to_not be_valid
    end

    it 'should have a valid country' do
      expect(
        FactoryGirl.build(
          :step,
          country: FactoryGirl.build(:country)
        )
      ).to be_valid
    end
  end

  describe '#experience' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, experience: nil)).to_not be_valid
    end

    it 'should have a valid experience' do
      expect(
        FactoryGirl.build(
          :step,
          experience: FactoryGirl.build(:experience)
        )
      ).to be_valid
    end
  end

  describe '#start_at' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, start_at: nil)).to_not be_valid
    end

    describe 'should have a valid start_at' do
      before do
        Timecop.freeze
        p Time.zone.now
      end

      after do
        Timecop.return
      end

      it 'must be after Time.now' do
        expect(FactoryGirl.build(:step, start_at: Time.zone.now)).to_not be_valid
      end

      it 'should be valid if "Time.now + 5.minutes"' do
        expect(FactoryGirl.build(:step, start_at: Time.zone.now + 5.minutes)).to be_valid
      end
    end
  end

  describe '#end_at' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, end_at: nil)).to_not be_valid
    end

    describe 'should have a valid end_at' do
      before do
        Timecop.freeze
        p Time.zone.now
      end

      after do
        Timecop.return
      end

      it 'must be after Time.now' do
        expect(FactoryGirl.build(:step, end_at: Time.zone.now)).to_not be_valid
      end

      it 'should be valid if "Time.now + 10.minutes"' do
        expect(FactoryGirl.build(:step, end_at: Time.zone.now + 10.minutes)).to be_valid
      end
    end
  end

  describe '#address' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, address: nil)).to_not be_valid
    end

    it 'should have a valid address' do
      expect(
        FactoryGirl.build(
          :step,
          address: "#{Faker::Address.street_address} #{Faker::Address.zip_code} #{Faker::Address.city}"
        )
      ).to be_valid
    end
  end

  describe '#lat' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, lat: nil)).to_not be_valid
    end

    it 'should have a valid lat' do
      expect(FactoryGirl.build(:step, lat: Faker::Address.latitude)).to be_valid
    end
  end

  describe '#long' do
    it 'can\'t be blank' do
      expect(FactoryGirl.build(:step, long: nil)).to_not be_valid
    end

    it 'should have a valid long' do
      expect(FactoryGirl.build(:step, long: Faker::Address.longitude)).to be_valid
    end
  end
end
