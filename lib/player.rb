# frozen_string_literal: true

class Player
  def initialize(player_name, player_marker)
    @player_name = player_name
    @player_marker = player_marker
    @marker_locations = []
  end

  def get_player_marker
    @player_marker
  end

  def get_player_marker_locations
    @marker_locations
  end

  def add_marker(marker)
    @marker_locations << marker
  end

  def to_s
    @player_name
  end
end
