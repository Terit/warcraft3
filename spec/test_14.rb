require_relative 'spec_helper'

describe Barracks do

  it "should have 500 lumber" do
    @barracks = Barracks.new
    expect(@barracks.lumber).to eq(500)
  end

end