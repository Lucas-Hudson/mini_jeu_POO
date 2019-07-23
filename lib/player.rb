class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} has #{@life_points} life points."
  end

  def gets_damage(damage)
    @life_points = @life_points - damage

    if @life_points <= 0
      puts "#{@name} has been killed!"
    end
  end

  def attacks(player)
    puts "#{@name} attacks #{player.name}."
    damage_inflicted = compute_damage
    player.gets_damage(damage_inflicted)
    if player.life_points > 0
    puts "The player #{@name} inflicts #{damage_inflicted} damages."
    end
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} has #{@life_points} life points and has a weapon level #{@weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_found = rand(1..6)
    puts "You found a weapon level #{weapon_found}"
    if weapon_found > @weapon_level
      @weapon_level = weapon_found
      puts "Yay! This weapon is better than the one you have. Take it."
    else
      puts "Sh@*#$.. It's not a better weapon than the one you have... Leave it."
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    puts health_pack_found
    if health_pack_found == 1
      puts "You didn't find anything."
    elsif health_pack_found > 1 && health_pack_found < 6
      puts "Yay! You found 50 life points."
      if @life_points <= 50
        @life_points = @life_points + 50
      else
        @life_points = @life_points + 50 - (@life_points - 50)
      end
    else
      puts "Wooow!! You found 80 life points."
        @life_points = @life_points + 80
        if @life_points > 100
          @life_points = @life_points + (100 - @life_points)
        end
    end
  end

end
