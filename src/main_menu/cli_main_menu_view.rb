require 'observer'

# View that represents the main menu screen for CLI
class CLIMainMenuView
  include(Observable)

  def draw(_state)
    puts('Which game type?')
    puts('Options: Connect 4 (0) or Toot and Otto (1)')
    valid_type = false
    until valid_type
      input = Readline.readline('Game type?', true)
      if %w[0 1].include?(input)
        valid_type = true
        game_type = Integer(input)
        changed
        notify_observers('game_type_changed', game_type)
      else
        puts('Invalid game type. Must be 0 or 1.')
      end
    end

    puts('Which game mode?')
    puts('Options: Player vs. Player (0), Player vs. CPU (1), CPU vs. Player (2), or CPU vs. CPU (3)')
    valid_mode = false
    until valid_mode
      input = Readline.readline('Game mode?', true)
      if %w[0 1 2 3].include?(input)
        valid_mode = true
        game_mode = Integer(input)
        changed
        notify_observers('game_mode_changed', game_mode)
      else
        puts('Invalid game mode. Must be 0, 1, 2, or 3')
      end
    end

    changed
    notify_observers('start_game')
  end
end
