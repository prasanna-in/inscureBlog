require 'rails_helper'

RSpec.describe Blog, :type => :model do

  describe '#valid?' do
    subject { create :blog, title: 'Name', body: 'Some content' }

    it { expect(subject.valid?).to be }

    context 'name' do
      let(:name) { 'Jon' }
      subject { build :blog, title: name }

      context 'invalid if empty' do
        let(:name) { '' }

        it 'error' do
          expect(subject.valid?).to be(false)
          expect(subject.errors.messages[:title]).to eq(["can't be blank"])
        end
      end
    end
  end
end