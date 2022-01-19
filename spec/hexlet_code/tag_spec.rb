# frozen_string_literal: true

RSpec.describe "test" do
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
    end
  end
end
