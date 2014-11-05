require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its Health Points" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @barracks.damage(10)
      expect(@barracks.health_points).to eq(490)
    end
  end

  describe Footman do

    it "attacks barracks at half attack_power" do
      @footman = Footman.new
      @barracks = Barracks.new
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end

  end
end
