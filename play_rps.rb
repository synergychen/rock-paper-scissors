require "./rps_analyzer"
require "./ai"

class PlayRPS
  RPS = ["R", "P", "S"]

  def initialize(total_round_number)
    @total_round_number = total_round_number
    @game_mode = "ai_loss"
    @final_scores = []
  end

  def play
    @total_round_number.times do |round_number|
      play_round(round_number)
    end
    show_total_scores
  end

  private

  def play_round(round_number)
    puts "=== Play round #{round_number + 1} ==="
    print "Your move? (R/P/S, q to quit) > "

    user_rps = get_user_rps
    ai_rps = get_ai_rps(user_rps)

    puts "AI played " + ai_rps
    rps_analyzer = RpsAnalyzer.new(user_rps, ai_rps)
    @final_scores << rps_analyzer.get_score_and_show_winner
  end

  def show_total_scores
    total_score = @final_scores.count(1) / @final_scores.count.to_f
    puts to_percent_of(total_score)
  end

  def to_percent_of(total_score)
    puts "You won #{(total_score * 100).round.to_s}% of hands so far"
  end

  def get_user_rps
    gets.chomp
  end

  def get_ai_rps(user_rps)
    ai = AI.new(user_rps, @game_mode)
    ai.get_rps
  end
end

game_rounds = 3
game = PlayRPS.new(game_rounds)
game.play
