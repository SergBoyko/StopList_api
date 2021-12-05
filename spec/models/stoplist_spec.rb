require 'rails_helper'
describe Stoplist do

  describe 'phone cant be blank' do
    it { should validate_presence_of :phone }
  end

  describe 'phone must be uniq' do
    it {should validate_uniqueness_of :phone}
  end

  describe 'validate phone size(max15)' do
    it {should validate_length_of(:phone).is_at_most(15)}
  end

  describe 'should allow phone with +7' do
    it { should allow_value('+79199699926').for(:phone) }
  end

  describe 'it should allow only digital phone number' do
    it {should_not allow_values('foo', 'buz').for(:phone)}
  end

end