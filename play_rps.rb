require "./rps_analyzer"
require "./ai"

class PlayRPS
  RPS = ["R", "P", "S"]

  def initialize(total_round_number)
    @total_round_number = total_round_number
    @game_mode = "random"
    @all_scores = []
  end

  def play
    user_choose_game_mode
    play_multiple_rounds
    show_total_scores
  end

  private

  def user_choose_game_mode
    puts "Please input a game mode: random / ai_win / ai_loss"
    print ">>> "
    @game_mode = gets.chomp
  end

  def play_multiple_rounds
    @total_round_number.times do |round_number|
      play_round(round_number)
    end
  end

  def play_round(round_number)
    user_rps = query_and_get_user_input(round_number)
    if user_rps != 'q'
      ai_rps = get_ai_rps(user_rps)
      analyze_and_ourput_results(user_rps, ai_rps)
    end
  end

  def query_and_get_user_input(round_number)
    puts "=" * 20
    puts "=== Play round #{round_number + 1} ==="
    print "Your move? (R/P/S, q to quit) > "
    gets.chomp
  end

  def get_ai_rps(user_rps)
    ai = AI.new(user_rps, @game_mode)
    ai.get_rps
  end

  def analyze_and_ourput_results(user_rps, ai_rps)
    puts "AI played #{ai_rps}"
    rps_analyzer = RpsAnalyzer.new(user_rps, ai_rps)
    @all_scores << rps_analyzer.get_score_and_show_winner
  end

  def show_total_scores
    total_score_in_decimal = @all_scores.count("player_win") / @all_scores.count.to_f
    print_score_to_percent_of(total_score_in_decimal)
  end

  def print_score_to_percent_of(total_score)
    puts "You won #{(total_score * 100).round.to_s}% of hands so far"
  end
end

# game_rounds = 3
# game = PlayRPS.new(game_rounds)
# game.play
