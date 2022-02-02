# frozen_string_literal: true

RSpec.describe HexletCode::HtmlTag do
  describe '.build' do
    let(:tag_name) { '' }
    let(:params) { {} }

    subject { described_class.build(tag_name, params) }

    context 'unsupported tag' do
      let(:tag_name) { 'hello' }

      it 'raises error' do
        expect { subject }.to raise_error(::HexletCode::Error, "Unsupported tag: `#{tag_name}`")
      end
    end

    context 'single tags' do
      context 'br' do
        let(:tag_name) { 'br' }

        it { is_expected.to eq(tags('html/br.html')) }
      end

      context 'img' do
        let(:tag_name) { 'img' }
        let(:params) { { src: 'path/to/image' } }

        it { is_expected.to eq(tags('html/img.html')) }
      end

      context 'input' do
        let(:tag_name) { 'input' }
        let(:params) { { type: 'submit', value: 'Save' } }

        it { is_expected.to eq(tags('html/input.html')) }
      end
    end

    context 'paired tags' do
      subject { described_class.build(tag_name, params) { block.call } }
      let(:block) { -> {} }

      context 'label' do
        let(:tag_name) { 'label' }
        let(:params) { { for: 'email' } }
        let(:block) { -> { 'Email' } }

        it { is_expected.to eq(tags('html/label.html')) }
      end

      context 'div' do
        let(:tag_name) { 'div' }

        it { is_expected.to eq(tags('html/div.html')) }
      end
    end
  end
end
