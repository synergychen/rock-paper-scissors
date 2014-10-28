require "./rps_analyzer"

class PlayRPS
  RPS = ["R", "P", "S"]

  def initialize(total_round_number)
    @total_round_number = total_round_number
    @play_mode = "random"
  end

  def play
    @total_round_number.times do |round_number|
      play_round(round_number)
    end
  end

  private

  def play_round(round_number)
    puts "=== Play round #{round_number + 1} ==="
    print "Your move? (R/P/S, q to quit) > "

    user_rps = get_user_rps
    ai_rps = get_ai_rps(@play_mode)

    puts "AI played " + ai_rps
    rps_analyzer = RpsAnalyzer.new(user_rps, ai_rps)
    rps_analyzer.show_winner
  end

  def get_user_rps
    gets.chomp
  end

  def get_ai_rps(play_mode)
    if play_mode == "random"
      RPS.sample
    end
  end
end

game = PlayRPS.new(3)
game.play
