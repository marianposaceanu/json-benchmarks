# json-benchmarks

A simple Ruby script to compare Hjson to JSON::Ext and Oj using it/s and memory usage as criteria.

- [JSON::Ext](http://ruby-doc.org/stdlib-2.4.1/libdoc/json/rdoc/JSON.html)
- [Oj gem](https://github.com/ohler55/oj)
- [Hjson gem](https://github.com/hjson/hjson-rb)

What is Hjson?

>JSON is easy for humans to read and write... in theory. In practice JSON gives us plenty of opportunities to make mistakes without even realizing it.

via [Hjson](https://hjson.org)

### Results

```
Warming up --------------------------------------
           JSON::Ext    32.814k i/100ms
               Hjson   330.000  i/100ms
                  Oj    49.686k i/100ms
Calculating -------------------------------------
           JSON::Ext    396.235k (± 2.6%) i/s -      2.002M in   5.055496s
               Hjson      3.260k (± 5.2%) i/s -     16.500k in   5.077614s
                  Oj    645.841k (± 4.6%) i/s -      3.230M in   5.012269s

Comparison:
                  Oj:   645840.8 i/s
           JSON::Ext:   396235.5 i/s - 1.63x  slower
               Hjson:     3259.5 i/s - 198.14x  slower

Calculating -------------------------------------
           JSON::Ext   608.000  memsize (     0.000  retained)
                         9.000  objects (     0.000  retained)
                         2.000  strings (     0.000  retained)
               Hjson    47.248k memsize (     0.000  retained)
                       918.000  objects (     0.000  retained)
                        50.000  strings (     0.000  retained)
                  Oj   472.000  memsize (     0.000  retained)
                         8.000  objects (     0.000  retained)
                         2.000  strings (     0.000  retained)

Comparison:
                  Oj:        472 allocated
           JSON::Ext:        608 allocated - 1.29x more
               Hjson:      47248 allocated - 100.10x more
```

hardware configuration: i7 3770, 16GB of RAM, 840 Pro SSD
