require 'spec_helper'
require 'rspec_matcher_num_times'

describe '#include_num_times' do
  context 'overall' do
    it "has the correct description for once" do
      matcher = include_num_times(1, 'foo')
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "include 'foo' once"
    end
    it "has the correct description" do
      matcher = include_num_times(3, 'foo')
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "include 'foo' 3 times"
    end
    it "has the correct description for 0" do
      matcher = include_num_times(0, 'foo')
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "include 'foo' 0 times"
    end
  end
  context '.should' do
    context 'string' do
      context 'when not contained' do
        it 'fails' do
          matcher = include_num_times(1, 'foo')
          expect(matcher.matches?('bar baz')).to eq false
        end
        it "has the correct failure message" do
          matcher = include_num_times(1, 'foo')
          matcher.matches?('bar baz')
          expect(matcher.failure_message).to eq "expected that value would include 'foo' once, but it is included 0 times"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would include 'foo' once, but it is included 0 times/m
          expect {
            expect('bar baz').to include_num_times(1, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = include_num_times(2, 'foo')
          expect(matcher.matches?('foo bar baz')).to eq false
        end
        it "has the correct failure message" do
          matcher = include_num_times(2, 'foo')
          matcher.matches?('foo bar baz')
          expect(matcher.failure_message).to eq "expected that value would include 'foo' 2 times, but it is included once"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would include 'foo' 2 times, but it is included once/m
          expect {
            expect('foo bar baz').to include_num_times(2, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when value matches' do
        it 'succeeds' do
          matcher = include_num_times(3, 'foo')
          expect(matcher.matches?('fooBARfooBAZfoo')).to eq true
        end
      end
    end
    context 'array' do
      context 'when not contained' do
        it 'fails' do
          matcher = include_num_times(1, 'foo')
          expect(matcher.matches?(['bar', 'baz'])).to eq false
        end
        it "has the correct failure message" do
          matcher = include_num_times(1, 'foo')
          matcher.matches?(['bar', 'baz'])
          expect(matcher.failure_message).to eq "expected that value would include 'foo' once, but it is included 0 times"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would include 'foo' once, but it is included 0 times/m
          expect {
            expect(['bar', 'baz']).to include_num_times(1, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = include_num_times(2, 'foo')
          expect(matcher.matches?(['foo', 'bar', 'baz'])).to eq false
        end
        it "has the correct failure message" do
          matcher = include_num_times(2, 'foo')
          matcher.matches?(['foo', 'bar', 'baz'])
          expect(matcher.failure_message).to eq "expected that value would include 'foo' 2 times, but it is included once"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would include 'foo' 2 times, but it is included once/m
          expect {
            expect(['foo', 'bar', 'baz']).to include_num_times(2, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when value matches' do
        it 'succeeds' do
          matcher = include_num_times(3, 'foo')
          expect(matcher.matches?(['foo', 'BAR', 'foo', 'BAZ', 'foo'])).to eq true
        end
      end
    end
  end
  context '.should_not' do
    context 'string' do
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = include_num_times(1, 'foo')
          expect(matcher.does_not_match?('barfoobaz')).to eq false
        end
        it "fails with correct error" do
          expected_fail = /expected that value would not include 'foo' once/m
          expect {
            expect('barfoobaz').not_to include_num_times(1, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when correct' do
        it 'succeeds' do
          matcher = include_num_times(2, 'foo')
          expect(matcher.does_not_match?('fooBARfooBAZfoo')).to eq true
        end
      end
    end
    context 'array' do
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = include_num_times(1, 'foo')
          expect(matcher.does_not_match?(['bar', 'foo', 'baz'])).to eq false
        end
        it "fails with correct error" do
          expected_fail = /expected that value would not include 'foo' once/m
          expect {
            expect(['bar', 'foo', 'baz']).not_to include_num_times(1, 'foo')
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when correct' do
        it 'succeeds' do
          matcher = include_num_times(2, 'foo')
          expect(matcher.does_not_match?(['foo', 'BAR', 'foo', 'BAZ', 'foo'])).to eq true
        end
      end
    end
  end
end
