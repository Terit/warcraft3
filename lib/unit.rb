class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      enemy.damage((attack_power / 2.0).ceil)
    else
      enemy.damage(attack_power)
    end
  end

  def damage(amount)
    @health_points -= amount
  end

  def dead?
    health_points == 0 ? true : false
  end

end
