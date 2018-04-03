# frozen_string_literal: true

describe TooDoo::Storage do
  temp_path = 'tmp'
  db_file_name = 'test.db'
  full_db_path = "#{temp_path}/#{db_file_name}"

  before(:all) do
    puts "---------- db file will be placed to #{full_db_path} -----------"
    FileUtils.mkdir(temp_path)
    FileUtils.touch(full_db_path)
  end

  after(:each) do
    DBM.open(full_db_path, &:clear)
  end

  after(:all) do
    puts "---------- removing db file from #{full_db_path} ---------------"
    FileUtils.rm_rf(Dir['tmp'])
  end

  let(:body) { 'something here' }
  let(:first_task) { TooDoo::Task.new(body) }
  let(:second_task) { TooDoo::Task.new('something else') }

  subject { described_class.new(full_db_path) }

  describe '#all' do
    context 'when some entries exist' do
      before do
        subject.save first_task
        subject.save second_task
      end

      it { expect(subject.all).to eq([first_task, second_task]) }
    end

    context 'when db is empty' do
      it { expect(subject.all).to eq([]) }
    end
  end

  describe '#undone' do
    let(:second_task) do
      TooDoo::Task.new('something else', TooDoo::Task::DONE_STATUS)
    end

    before do
      subject.save first_task
      subject.save second_task
    end

    it { expect(subject.undone).to eq([first_task]) }
  end

  describe '#done' do
    let(:second_task) do
      TooDoo::Task.new('something else', TooDoo::Task::DONE_STATUS)
    end

    before do
      subject.save first_task
      subject.save second_task
    end

    it { expect(subject.done).to eq([second_task]) }
  end

  describe '#find' do
    before do
      subject.save first_task
      subject.save second_task
    end

    it { expect(subject.find(body)).to eq(first_task) }
  end

  describe '#save' do
    it do
      expect { subject.save(first_task) }
        .to change { subject.all.length }.from(0).to(1)
    end
  end

  describe '#remove' do
    before do
      subject.save first_task
    end

    it do
      expect { subject.remove(body) }
        .to change { subject.all.length }.from(1).to(0)
    end
  end

  describe '#remove_all' do
    before do
      subject.save first_task
      subject.save second_task
    end

    it do
      expect { subject.remove_all }
        .to change { subject.all.length }.from(2).to(0)
    end
  end
end
