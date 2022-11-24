require 'benchmark'
n = 10_000
s = 8_760

#  What is the fastest approach to perform 
#  operations (such as addition) on all elements 
#  of a vector?

def gen_vect(size)
  Array.new(size){|e| (rand()*10_000).round(2)}
end
What is the fastest approach to perform operations (such as addition) on all elements of a vector?

Benchmark.bm do |x|
  v1 = gen_vect(s)
  v2 = gen_vect(s)

  x.report do
    n.times do
      i = 0
      while i<s
        v1[i] += v2[i] # <===  this is the faster
        i+=1
      end
    end
  end

  x.report do
    n.times do
      s.times do |i|
        v1[i] += v2[i]
      end
    end
  end

  x.report do
    n.times do
      i = 0
      0.upto(s-1) do |i|
        v1[i] += v2[i]
      end
    end
  end

end
