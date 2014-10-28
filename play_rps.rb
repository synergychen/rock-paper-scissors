class PlayRPS
  RPS = ["R", "P", "S"]

  def play
    play_a_round
  end

  def play_a_round
    print "Your move? (R/P/S, q to quit) >"
    play_mode = "random"
    user_rps = get_user_rps
    ai_rps = get_ai_rps(play_mode)
    puts "AI played " + ai_rps
    show_winner(user_rps, ai_rps)
  end

  private

  def get_user_rps
    gets.chomp
  end

  def get_ai_rps(play_mode)
    if play_mode == "random"
      RPS.sample
    end
  end

  def show_winner(user_rps, ai_rps)
    compare_result = RPS.index(user_rps) - RPS.index(ai_rps)
    if user_win?(compare_result)
      puts "Player beats AI"
    elsif ai_win?(compare_result)
      puts "AI beats Player"
    else
      puts "equal"
    end
  end

  def user_win?(compare_result)
    compare_result == -2 || compare_result == 1
  end

  def ai_win?(compare_result)
    compare_result == -1 || compare_result == 2
  end
end

game = PlayRPS.new
game.play_a_round
