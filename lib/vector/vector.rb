module Vector
  class Vector
    attr_reader :arr

    def initialize(arr: [], size: 1, initial_value: 0.0)
      if arr.any?
        @arr = arr
      else
        @arr = Array.new(size){ initial_value }
      end
    end

    def size
      @arr.size
    end

    def [](i)
      @arr[i]
    end


    def add(other_vector)
      raise_error_on_different_size other_vector
      i = 0
      while i < @arr.size
        @arr[i]+=other_vector[i]
        i+=1
      end
      self
    end

    def subtract(other_vector)
      raise_error_on_different_size other_vector
      i = 0
      while i < @arr.size
        @arr[i]-=other_vector[i]
        i+=1
      end
      self
    end

    def multiply(other_vector)
      raise_error_on_different_size other_vector
      i = 0
      while i < @arr.size
        @arr[i]*=other_vector[i]
        i+=1
      end
      self
    end

    def divide(other_vector)
      raise_error_on_different_size other_vector
      i = 0
      while i < @arr.size
        @arr[i]/=other_vector[i]
        i+=1
      end
      self
    end


    # it will not modify the current vector
    def +(other_vector)
      raise_error_on_different_size other_vector
      a = Array.new(size){ |i| @arr[i]+other_vector[i] }
      Vector.new(arr: a)
    end

    def -(other_vector)
      raise_error_on_different_size other_vector
      a = Array.new(size){ |i| @arr[i]-other_vector[i] }
      Vector.new(arr: a)
    end

    def *(other_vector)
      raise_error_on_different_size other_vector
      a = Array.new(size){ |i| @arr[i]*other_vector[i] }
      Vector.new(arr: a)
    end

    def /(other_vector)
      raise_error_on_different_size other_vector
      a = Array.new(size){ |i| @arr[i]/other_vector[i] }
      Vector.new(arr: a)
    end



    def self.min(ya1, ya2)
      ya1.raise_error_on_different_size ya2
      a = Array.new(ya1.size){ |i| ya1[i]<ya2[i] ? ya1[i] : ya2[i] }
      Vector.new(arr: a)
    end

    def self.max(ya1, ya2)
      ya1.raise_error_on_different_size ya2
      a = Array.new(ya1.size){ |i| ya1[i]>ya2[i] ? ya1[i] : ya2[i] }
      Vector.new(arr: a)
    end

    def any?(&block)
      @arr.any?{|v| yield(v)}
    end

    def any_positive?
      any?{|e| e>0.0}
    end

    def any_negative?
      any?{|e| e<0.0}
    end

    def raise_error_on_different_size(other_vector)
      raise DifferentSizeError if other_vector.size!=size
    end

    def to_s(round: 2)
      @arr.first(6).map{|v| v.round(round)}.join(', ')
    end
  end
end


# Note:
# it is faster 'a>b ? a : b' than '[a,b].max' when calculating max (and min)
# Try to run:
# t=Time.now; 10_000_000.times{ [rand, rand].max }; Time.now-t
# vs
# t=Time.now; 10_000_000.times{ (a=rand)>(b=rand) ? a : b }; Time.now-t
# the first take 4.0s, the second 1.3s
