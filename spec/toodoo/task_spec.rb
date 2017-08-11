# frozen_string_literal: true

describe TooDoo::Task do
  let(:body) { 'something here' }

  subject { described_class.new(body) }

  describe '#done?' do
    it { expect(subject.status).to eq(:created) }

    context 'when task is done' do
      before do
        subject.done!
      end

      it { expect(subject.done?).to be_truthy }
    end

    context 'when task isnt done' do
      it { expect(subject.done?).to be_falsey }
    end
  end

  describe '#done!' do
    it do
      expect { subject.done! }
        .to change { subject.status }.from(:created).to(:done)
    end
  end
end
