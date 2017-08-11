# frozen_string_literal: true

describe TooDoo::Arguments do
  subject { described_class.new(args) }
  let(:command)  { 'add' }
  let(:argument) { 'task' }
  let(:args)     { [] }

  context 'when command and argument passed' do
    let(:second_argument) { 'argument' }
    let(:args) { [command, argument, second_argument] }

    describe '#command' do
      it { expect(subject.command).to eq(command) }
    end

    describe '#argument' do
      it { expect(subject.argument).to eq([argument, second_argument]) }
    end
  end

  context 'when only command passed' do
    let(:args) { [command] }

    describe '#command' do
      it { expect(subject.command).to eq(command) }
    end

    describe '#argument' do
      it { expect(subject.argument).to be_empty }
    end
  end

  context 'when nothing passed' do
    let(:args) { [] }

    describe '#command' do
      it { expect(subject.command).to eq(:command_missing) }
    end

    describe '#argument' do
      it { expect(subject.argument).to be_empty }
    end
  end
end
