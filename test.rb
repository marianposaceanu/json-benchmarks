require 'benchmark/ips'
require 'benchmark/memory'
require 'hjson'
require 'json'
require 'oj'


TEST_JSON_VALID = <<~JSON
  {
    "foo": [],
    "bar": []
  }
JSON

TEST_JSON_INVALID = <<~JSON
{
  foo: [],
  bar: []
}
JSON

puts JSON.parse(TEST_JSON_VALID)
puts Hjson.parse(TEST_JSON_INVALID)
puts Oj.load(TEST_JSON_VALID)

Benchmark.ips do |x|
  x.report('JSON::Ext') { JSON.parse(TEST_JSON_VALID) }
  x.report('Hjson') { Hjson.parse(TEST_JSON_INVALID) }
  x.report('Oj') { Oj.load(TEST_JSON_VALID) }

  x.compare!
end

Benchmark.memory do |x|
  x.report('JSON::Ext') { JSON.parse(TEST_JSON_VALID) }
  x.report('Hjson') { Hjson.parse(TEST_JSON_INVALID) }
  x.report('Oj') { Oj.load(TEST_JSON_VALID) }

  x.compare!
end
