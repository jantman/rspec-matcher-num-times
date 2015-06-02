require 'spec_helper'
require 'rspec_matcher_num_times'

describe '#match_num_times' do
  context 'overall' do
    it "has the correct description for once" do
      matcher = match_num_times(1, /foo/)
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "matches 'foo' once"
    end
    it "has the correct description" do
      matcher = match_num_times(3, /foo/)
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "matches 'foo' 3 times"
    end
    it "has the correct description for 0" do
      matcher = match_num_times(0, /foo/)
      matcher.matches?('foobarbaz')
      expect(matcher.description).to eq "matches 'foo' 0 times"
    end
  end
  context '.should' do
    context 'string' do
      context 'when not contained' do
        it 'fails' do
          matcher = match_num_times(1, /foo/)
          expect(matcher.matches?('bar baz')).to eq false
        end
        it "has the correct failure message" do
          matcher = match_num_times(1, /foo/)
          matcher.matches?('bar baz')
          expect(matcher.failure_message).to eq "expected that value would match 'foo' once, but it is matched 0 times"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would match 'foo' once, but it is matched 0 times/m
          expect {
            expect('bar baz').to match_num_times(1, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = match_num_times(2, /foo/)
          expect(matcher.matches?('foo bar baz')).to eq false
        end
        it "has the correct failure message" do
          matcher = match_num_times(2, /foo/)
          matcher.matches?('foo bar baz')
          expect(matcher.failure_message).to eq "expected that value would match 'foo' 2 times, but it is matched once"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would match 'foo' 2 times, but it is matched once/m
          expect {
            expect('foo bar baz').to match_num_times(2, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
        it "fails with correct error for multiple matches in sequence" do
          expected_fail = /expected that value would match 'foo' 2 times, but it is matched 3 times/m
          expect {
            expect('foofoofoo bar baz').to match_num_times(2, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when value matches' do
        it 'succeeds' do
          matcher = match_num_times(3, /foo/)
          expect(matcher.matches?('fooBARfooBAZfoo')).to eq true
        end
      end
    end
    context 'array' do
      context 'when not contained' do
        it 'fails' do
          matcher = match_num_times(1, /foo/)
          expect(matcher.matches?(['bar', 'baz'])).to eq false
        end
        it "has the correct failure message" do
          matcher = match_num_times(1, /foo/)
          matcher.matches?(['bar', 'baz'])
          expect(matcher.failure_message).to eq "expected that value would match 'foo' once, but it is matched 0 times"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would match 'foo' once, but it is matched 0 times/m
          expect {
            expect(['bar', 'baz']).to match_num_times(1, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = match_num_times(2, /foo/)
          expect(matcher.matches?(['foo', 'bar', 'baz'])).to eq false
        end
        it "has the correct failure message" do
          matcher = match_num_times(2, /foo/)
          matcher.matches?(['foo', 'bar', 'baz'])
          expect(matcher.failure_message).to eq "expected that value would match 'foo' 2 times, but it is matched once"
        end
        it "fails with correct error" do
          expected_fail = /expected that value would match 'foo' 2 times, but it is matched once/m
          expect {
            expect(['foo', 'bar', 'baz']).to match_num_times(2, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when value matches' do
        it 'succeeds' do
          matcher = match_num_times(3, /foo/)
          expect(matcher.matches?(['foo', 'BAR', 'foo', 'BAZ', 'foo'])).to eq true
        end
      end
    end
  end
  context '.should_not' do
    context 'string' do
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = match_num_times(1, /foo/)
          expect(matcher.does_not_match?('barfoobaz')).to eq false
        end
        it "fails with correct error" do
          expected_fail = /expected that value would not match 'foo' once/m
          expect {
            expect('barfoobaz').not_to match_num_times(1, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when correct' do
        it 'succeeds' do
          matcher = match_num_times(2, /foo/)
          expect(matcher.does_not_match?('fooBARfooBAZfoo')).to eq true
        end
      end
    end
    context 'array' do
      context 'when number of times is wrong' do
        it 'fails' do
          matcher = match_num_times(1, /foo/)
          expect(matcher.does_not_match?(['bar', 'foo', 'baz'])).to eq false
        end
        it "fails with correct error" do
          expected_fail = /expected that value would not match 'foo' once/m
          expect {
            expect(['bar', 'foo', 'baz']).not_to match_num_times(1, /foo/)
          }.to raise_error(RSpec::Expectations::ExpectationNotMetError).with_message(expected_fail)
        end
      end
      context 'when correct' do
        it 'succeeds' do
          matcher = match_num_times(2, /foo/)
          expect(matcher.does_not_match?(['foo', 'BAR', 'foo', 'BAZ', 'foo'])).to eq true
        end
      end
    end
  end
end
