require 'brightcontent/view_lookup/base'

module Brightcontent::ViewLookup
  describe Base do
    class FakeFormField < Base
      def field_type
        :string
      end
    end

    let(:resource_class) { double(:resource_class, reflect_on_association: nil) }
    let(:view_context) { double(:view_context, resource_class: resource_class) }
    let(:item) { double(:item, name: 'Item name') }
    let(:fake_form_field) { FakeFormField.new(view_context, field: 'name', item: item) }

    context 'with specific field partial' do
      it 'renders the partial' do
        expect(view_context).to receive(:render_if_exists)
          .with("fake_form_field_name", {field: 'name', item: item}) { "Result" }
        fake_form_field.call
      end
    end

    context 'with specific field type partial' do
      it 'renders the partial' do
        expect(view_context).to receive(:render_if_exists).once
        expect(view_context).to receive(:render_if_exists)
          .with("brightcontent/base/fake_form_fields/string", {field: 'name', item: item}) { "Result" }
        fake_form_field.call
      end
    end

    context 'with association type' do
      it 'renders the partial' do
        allow(resource_class).to receive(:reflect_on_association).with(:name) { double(macro: "has_one") }
        expect(view_context).to receive(:render_if_exists).twice
        expect(view_context).to receive(:render_if_exists)
          .with("brightcontent/base/fake_form_fields/has_one", {field: 'name', item: item}) { "Result" }
        fake_form_field.call
      end
    end

    context 'without partial' do
      it 'renders the default value' do
        expect(view_context).to receive(:render_if_exists).once
        allow(fake_form_field).to receive(:field_type) { nil }
        expect(fake_form_field.call).to eq 'Item name'
      end
    end
  end
end
