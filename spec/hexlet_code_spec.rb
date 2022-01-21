# frozen_string_literal: true

RSpec.describe HexletCode do
  it "has a version number" do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe ".form_for" do
    let(:params) { {} }
    let(:object) { nil }

    subject { described_class.form_for(object, params) }

    context "for user" do
      let(:object) { Struct.new(:name, :job, keyword_init: true).new(name: "rob") }

      it { is_expected.to eq(tags.form.plain.html) }
    end

    context "for user with inputs" do
      let(:object) { Struct.new(:name, :job, keyword_init: true).new(name: "rob") }

      subject do
        described_class.form_for(object, params) do |f|
          f.input :name
          f.input :job, as: :text
        end
      end

      it { is_expected.to eq(tags.form.with_inputs.html) }
    end
  end
end
