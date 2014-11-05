require_relative 'spec_helper'

describe Unit do
  
  describe "#attack" do

    it "shouldn't be able to attack when dead" do
      @unit = Unit.new(0,10)
      expect(@unit.attack!(Footman.new)).to eq(false)
    end

    it "shouldn't be able to attack dead units" do
      @unit = Unit.new(50,10)
      @dead_unit = Unit.new(0,10)
      expect(@unit.attack!(@dead_unit)).to eq(false)
    end

  end

end