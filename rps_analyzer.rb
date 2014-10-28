class RpsAnalyzer
  RPS = ["R", "P", "S"]

  def initialize(user_rps, ai_rps)
    @user_rps = user_rps
    @ai_rps = ai_rps
  end

  def show_winner
    compare_result = RPS.index(@user_rps) - RPS.index(@ai_rps)
    if user_win?(compare_result)
      puts "Player beats AI"
    elsif ai_win?(compare_result)
      puts "AI beats Player"
    else
      puts "Tie game"
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

# rps_analyzer = RpsAnalyzer.new("R", "S")
# rps_analyzer.show_winner
