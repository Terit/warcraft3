require_relative 'spec_helper'

describe SiegeEngine do

  before :all do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe "#attack!" do 

    it "shouldn't damage Footman" do
      @footman = Footman.new
      @siege_engine.attack!(@footman)
      expect(@footman.health_points).to eq(60)
    end

    it "shouldn't damage Peasants" do
      @peasant = Peasant.new
      @siege_engine.attack!(@peasant)
      expect(@peasant.health_points).to eq(35)
    end

    it "should do double damage to Barracks" do
      @barracks = Barracks.new
      @siege_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end

    it "should damage other Siege Engines" do
      @siege_engine2 = SiegeEngine.new
      @siege_engine.attack!(@siege_engine2)
      expect(@siege_engine2.health_points).to eq(350)
    end

  end

end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege_engine" do

    it "should cost 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it "should cost 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77)
    end

    it "should cost 60 lumber" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
    end

    it "should produce a seige engine" do
      expect(@barracks.train_siege_engine).to be_an_instance_of(SiegeEngine)
    end

    it "does not train a seige engine if there aren't enough resources" do
      @barracks.should_receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end

    it "does train a seige unit if there are enough resources" do
      @barracks.should_receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end

  describe "#can_train_siege_engine?" do

    it "should return false if there isn't enough gold" do
      @barracks.should_receive(:gold).and_return(100)
      expect(@barracks.can_train_siege_engine?).to eq(false)
    end

    it "should return false if there isn't enough food" do
      @barracks.should_receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to eq(false)
    end

    it "should return false if there isn't enough lumber" do
      @barracks.should_receive(:lumber).and_return(50)
      expect(@barracks.can_train_siege_engine?).to eq(false)
    end

  end

end
