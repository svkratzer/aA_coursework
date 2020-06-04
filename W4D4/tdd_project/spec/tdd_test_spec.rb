require_relative "spec_helper"
require "tdd_test"

describe Test do
  it "intializes" do
    test = Test.new
    expect(test).to be_a(Test)
  end
end