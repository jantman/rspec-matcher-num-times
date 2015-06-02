require "rspec_matcher_num_times"

RSpec::Matchers.define :include_num_times do |num_times, incl_item|
  match do |actual|
    if actual.is_a? String
      actual.scan(incl_item).length == num_times ? true : false
    else
      # we assume an array...
      actual.count(incl_item) == num_times ? true : false
    end
  end

  match_when_negated do |actual|
    if actual.is_a? String
      actual.scan(incl_item).length == num_times ? false : true
    else
      # we assume an array...
      actual.count(incl_item) == num_times ? false : true
    end
  end

  failure_message do |actual|
    if actual.is_a? String
      res = actual.scan(incl_item).length
    else
      # we assume an array...
      res = actual.count(incl_item)
    end
    ns = num_str(num_times)
    ns_actual = num_str(res)
    "expected that value would include '#{incl_item}' #{ns}, but it is included #{ns_actual}"
  end

  failure_message_when_negated do |actual|
    if actual.is_a? String
      res = actual.scan(incl_item).length
    else
      # we assume an array...
      res = actual.count(incl_item)
    end
    ns = num_str(num_times)
    ns_actual = num_str(res)
    "expected that value would not include '#{incl_item}' #{ns}"
  end

  description do
    ns = num_str(num_times)
    "include '#{incl_item}' #{ns}"
  end

  def num_str(n)
    return 'once' if n == 1
    return "#{n} times"
  end
end
