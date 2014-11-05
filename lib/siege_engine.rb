require_relative 'unit'

class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a? Peasant
      enemy.damage(0)
    elsif enemy.is_a? Footman
      enemy.damage(0)
    elsif enemy.is_a? Barracks
      enemy.damage(attack_power * 2)
    else
      enemy.damage(attack_power)
    end
  end

end
