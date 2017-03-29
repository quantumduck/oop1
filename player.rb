class Player

  attr_accessor :health_points
  attr_accessor :lives
  attr_accessor :gold_coins

  def initialize(name = "Player")
    @name = name.to_s
    @lives = 5
    @gold_coins = 0
    @health_points = 10
  end

  def collect_treasure
    if (@gold_coins % 10 == 9)
      level_up
    end
    @gold_coins += 1
  end

  def do_battle
    if(@health_points > 1)
      @health_points -= 1
    else
      if(@lives > 0)
        @lives -= 1
        @health_points = 10
      else
        restart
      end
    end
    @health_points
  end


  private

  def level_up
    @lives += 1
  end

  def restart
    puts "#{@name} is dead. Long live #{@name}!"
    @lives = 5
    @gold_coins = 0
    @health_points = 10
  end

end

player1 = Player.new("The King")
