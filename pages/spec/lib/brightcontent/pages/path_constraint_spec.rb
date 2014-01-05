require 'spec_helper'

module Brightcontent
  module Pages
    describe PathConstraint do
      describe "#expire" do
        it 'clear the cache' do
          expect(Rails.cache).to receive(:delete)
          PathConstraint.expire
        end
      end

      describe ".matches?" do
        before do
          PathConstraint.expire
          allow(Page).to receive(:pluck) { ['existing'] }
        end

        it 'returns true if path is existing' do
          request = double(:request, path: '/existing')
          expect(subject.matches?(request)).to be_true
        end
        it 'returns false if path is non-existing' do
          request = double(:request, path: '/nonexisting')
          expect(subject.matches?(request)).to be_false
        end
      end
    end
  end
end
