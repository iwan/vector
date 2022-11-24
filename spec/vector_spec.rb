# frozen_string_literal: true

RSpec.describe Vector do

  it "has a version number" do
    expect(Vector::VERSION).not_to be nil
  end

  it "initialize a Vector passing an array" do
    v = Vector::Vector.new(arr: [2,3,2,3,2,3])
    expect(v.arr[0]).to eq(2)
    expect(v.arr[5]).to eq(3)
    expect(v.arr[6]).to eq(nil)
    expect(v.size).to eq(6)
  end

  it "initialize a Vector passing a size and initial_value" do
    v = Vector::Vector.new(size: 6, initial_value: 3)
    expect(v.arr[0]).to eq(3)
    expect(v.arr[5]).to eq(3)
    expect(v.arr[6]).to eq(nil)
    expect(v.size).to eq(6)
  end

  it "has a size" do
    expect(Vector::Vector.new(arr: [2,3,2,3,2,3,2,3]).size).to eq(8)
    expect(Vector::Vector.new(size: 51, initial_value: 3).size).to eq(51)
  end

  it "has square brackets function" do
    v = Vector::Vector.new(arr: [2,3,5,8,13])
    expect(v[0]).to eq(2)
    expect(v[1]).to eq(3)
    expect(v[2]).to eq(5)
    expect(v[3]).to eq(8)
    expect(v[4]).to eq(13)
  end

  it "add an other vector" do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v1.add(v2)
    expect(v1[0]).to eq(5)
    expect(v1.size).to eq(6)
  end

  it "raise an error when add an other vector with different size" do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6,7])
    expect { v1.add(v2) }.to raise_error(DifferentSizeError)
  end

  it 'calculate v1+v2' do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v = v1+v2
    expect(v.size).to eq(6)
    expect(v[0]).to eq(5)
    expect(v[1]).to eq(5)
    expect(v[2]).to eq(5)
    expect(v[3]).to eq(5)
    expect(v[4]).to eq(5)
    expect(v[5]).to eq(9)
  end

  it 'calculate v1-v2' do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v = v1-v2
    expect(v.size).to eq(6)
    expect(v[0]).to eq(-1)
    expect(v[1]).to eq(1)
    expect(v[2]).to eq(-1)
    expect(v[3]).to eq(1)
    expect(v[4]).to eq(-1)
    expect(v[5]).to eq(-3)
  end

  it 'calculate v1*v2' do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v = v1*v2
    expect(v.size).to eq(6)
    expect(v[0]).to eq(6)
    expect(v[1]).to eq(6)
    expect(v[2]).to eq(6)
    expect(v[3]).to eq(6)
    expect(v[4]).to eq(6)
    expect(v[5]).to eq(18)
  end

  it 'calculate v1/v2' do
    v1 = Vector::Vector.new(arr: [12,-1,7.0,0,6,1.0])
    v2 = Vector::Vector.new(arr: [6,2,2,-12.3,3,-4])
    v = v1/v2
    expect(v.size).to eq(6)
    expect(v[0]).to eq(2)
    expect(v[1]).to eq(-1)
    expect(v[2]).to eq(3.5)
    expect(v[3]).to eq(0)
    expect(v[4]).to eq(2)
    expect(v[5]).to eq(-0.25)
  end

  it "get the max" do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v  = Vector::Vector.max(v1, v2)
    expect(v.size).to eq(6)
    expect(v[0]).to eq(3)
    expect(v[1]).to eq(3)
    expect(v[2]).to eq(3)
    expect(v[3]).to eq(3)
    expect(v[4]).to eq(3)
    expect(v[5]).to eq(6)
  end

  it "get the min" do
    v1 = Vector::Vector.new(arr: [2,3,2,3,2,3])
    v2 = Vector::Vector.new(arr: [3,2,3,2,3,6])
    v  = Vector::Vector.min(v1, v2)
    expect(v.size).to eq(6)
    expect(v[0]).to eq(2)
    expect(v[1]).to eq(2)
    expect(v[2]).to eq(2)
    expect(v[3]).to eq(2)
    expect(v[4]).to eq(2)
    expect(v[5]).to eq(3)
  end
end
