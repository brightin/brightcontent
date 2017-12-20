require 'spec_helper'

describe Brightcontent::TranslationHelper do
  let(:string) { "thing" }
  let(:model) { Brightcontent::AdminUser }

  describe '#nominative_plural' do
    it "pluralizes strings" do
      expect(helper.nominative_plural(string)).to eq("things")
    end

    it "pluralizes active record models" do
      expect(helper.nominative_plural(model)).to eq("Admins")
    end
  end

  describe '#nominative_singular' do
    it "returns a singular strings" do
      expect(helper.nominative_singular(string)).to eq("thing")
    end

    it "deals with active record models" do
      expect(helper.nominative_singular(model)).to eq("Admin")
    end
  end

end
