# require "./play_rps"

class RpsAnalyzer
  def initialize(user_rps, ai_rps)
    @user_rps = user_rps
    @ai_rps = ai_rps
    @RPS_values = PlayRPS::RPS
  end

  def get_score_and_show_winner
    compare_result = @RPS_values.index(@user_rps) - @RPS_values.index(@ai_rps)
    if user_win?(compare_result)
      puts "Player beats AI"
      "player_win"
    elsif ai_win?(compare_result)
      puts "AI beats Player"
      "ai_win"
    else
      puts "Tie game"
      "tie_game"
    end
  end

  private

  def user_win?(compare_result)
    user_win_case = [-2, 1]
    user_win_case.include?(compare_result)
  end

  def ai_win?(compare_result)
    ai_win_case = [-1, 2]
    ai_win_case.include?(compare_result)
  end
end
