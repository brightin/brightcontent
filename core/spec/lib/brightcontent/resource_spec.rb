require 'brightcontent/resource'

describe Brightcontent::Resource do
  FakeBlog = Module.new
  Brightcontent::FakeComment = Module.new

  describe '.klass' do
    it 'returns the class of the path' do
      expect(described_class.new('fake_blog').klass).to eq FakeBlog
    end

    it 'returns the brightcontent namespaces path if not exist' do
      expect(described_class.new('fake_comment').klass).to eq Brightcontent::FakeComment
    end
  end
end
