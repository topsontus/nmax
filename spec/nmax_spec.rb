require 'spec_helper'
require_relative '../nmax'
require 'pry'

RSpec.describe Nmax do
  describe '#call' do
    before { $stdin = File.read('tmp/data.txt') }

    context 'when n is 2' do
      it { expect { described_class.new(2).call }.to output("[20, 1000]\n").to_stdout }
    end

    context 'when n is 3' do
      it { expect { described_class.new(3).call }.to output("[15, 20, 1000]\n").to_stdout }
    end

    context 'when n is 4' do
      it { expect { described_class.new(4).call }.to output("[15, 15, 20, 1000]\n").to_stdout }
    end

    context 'when n is 5' do
      it { expect { described_class.new(5).call }.to output("[-1, 15, 15, 20, 1000]\n").to_stdout }
    end
  end
end
