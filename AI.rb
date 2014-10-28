class AI
  def initialize(user_rps, game_mode)
    @user_rps = user_rps
    @game_mode = game_mode
    @RPS_values = PlayRPS::RPS
  end

  def get_rps
    if @game_mode == "random"
      get_random_rps
    elsif @game_mode == "ai_win"
      ai_always_win_rps
    elsif @game_mode == "ai_loss"
      ai_always_loss_rps
    end
  end

  private

  def get_random_rps
    @RPS_values.sample
  end

  def ai_always_win_rps
    index_of_next_rps = @RPS_values.index(@user_rps).next % 3
    @RPS_values[index_of_next_rps]
  end

  def ai_always_loss_rps
    index_of_previous_rps = @RPS_values.reverse.index(@user_rps).next % 3
    @RPS_values.reverse[index_of_previous_rps]
  end
end
