require_relative 'spec_helper'

describe Unit do

  it "New units have health_points when created." do
    @unit = Unit.new(50,10)
    expect(@unit.health_points).to eq(50)
  end

  describe "#dead?" do

    it "should be alive when created." do
      @unit = Unit.new(50,10)
      expect(@unit.dead?).to eq(false)
    end

    it "should be dead when health_points = 0" do
      @unit = Unit.new(0,10)
      expect(@unit.dead?).to eq(true)
    end
  end

end