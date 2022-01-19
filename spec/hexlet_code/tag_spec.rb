# frozen_string_literal: true

RSpec.describe HexletCode::Tag do
  describe ".build" do
    let(:tag_name) { "" }
    let(:params) { {} }

    subject { described_class.build(tag_name, params) }

    context "single tags" do
      context "br" do
        let(:tag_name) { "br" }

        it { is_expected.to eq(tags.br.html) }
      end

      context "img" do
        let(:tag_name) { "img" }
        let(:params) { { src: "path/to/image" } }

        it { is_expected.to eq(tags.img.html) }
      end

      context "input" do
        let(:tag_name) { "input" }
        let(:params) { { type: "submit", value: "Save" } }

        it { is_expected.to eq(tags.input.html) }
      end
    end

    context "paired tags" do
      subject { described_class.build(tag_name, params) { block.call } }
      let(:block) { -> {} }

      context "label" do
        let(:tag_name) { "label" }
        let(:params) { { for: "email" } }
        let(:block) { -> { "Email" } }

        it { is_expected.to eq(tags.label.html) }
      end

      context "div" do
        let(:tag_name) { "div" }

        it { is_expected.to eq(tags.div.html) }
      end
    end
  end
end
