require "rspec_matcher_num_times"

RSpec::Matchers.define :match_num_times do |num_times, val_regex|
  match do |actual|
    if actual.is_a? String
      actual.scan(val_regex).length == num_times ? true : false
    else
      # we assume an array...
      actual.select{ |x| x[val_regex] }.length == num_times ? true : false
    end
  end

  match_when_negated do |actual|
    if actual.is_a? String
      actual.scan(val_regex).length == num_times ? false : true
    else
      # we assume an array...
      actual.select{ |x| x[val_regex] }.length == num_times ? false : true
    end
  end

  failure_message do |actual|
    if actual.is_a? String
      res = actual.scan(val_regex).length
    else
      # we assume an array...
      res = actual.select{ |x| x[val_regex] }.length
    end
    ns = num_str(num_times)
    ns_actual = num_str(res)
    "expected that value would match '#{val_regex.source}' #{ns}, but it is matched #{ns_actual}"
  end

  failure_message_when_negated do |actual|
    if actual.is_a? String
      res = actual.scan(val_regex).length
    else
      # we assume an array...
      res = actual.select{ |x| x[val_regex] }.length
    end
    ns = num_str(num_times)
    ns_actual = num_str(res)
    "expected that value would not match '#{val_regex.source}' #{ns}"
  end

  description do
    ns = num_str(num_times)
    "matches '#{val_regex.source}' #{ns}"
  end

  def num_str(n)
    return 'once' if n == 1
    return "#{n} times"
  end
end
