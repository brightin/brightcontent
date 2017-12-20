require 'brightcontent/resources'

module Brightcontent
  describe Resources do

    let(:array) { [1, 2, 3, 4, 5] }
    let(:resources) { Resources.new(array) }

    it 'behaves like an array' do
      expect(resources).to eq array
    end

    context 'main menu count of 4' do
      before do
        allow(Brightcontent).to receive(:main_menu_count) { 4 }
      end

      it 'gives the main menu items (with extra counting as an item)' do
        expect(resources.main_menu).to eq [1, 2, 3]
      end

      it 'gives the extra menu items' do
        expect(resources.extra_menu).to eq [4, 5]
      end

      it 'does have any exta menu items' do
        expect(resources.extra_menu?).to be true
      end
    end

    context 'main menu count of 5' do
      before do
        allow(Brightcontent).to receive(:main_menu_count) { 5 }
      end

      it 'gives the main menu items' do
        expect(resources.main_menu).to eq array
      end

      it 'gives the extra menu items' do
        expect(resources.extra_menu).to eq []
      end

      it 'does not have any exta menu items' do
        expect(resources.extra_menu?).to be false
      end
    end

    context 'main menu count of 6' do
      before do
        allow(Brightcontent).to receive(:main_menu_count) { 6 }
      end

      it 'gives the main menu items' do
        expect(resources.main_menu).to eq array
      end

      it 'gives the extra menu items' do
        expect(resources.extra_menu).to eq []
      end

      it 'does not have any exta menu items' do
        expect(resources.extra_menu?).to be false
      end
    end
  end
end
