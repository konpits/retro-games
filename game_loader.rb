# A collection of retro games. Presents games menu and loads games
require 'colorize'
require 'terminal-table'
require 'snake_game'

module GameLoader
    #contains all games information
    GAMES = [
    { 
        name: "SNAKE",
        description_formal: "A classic retro game with a twist.",
        description_informal: "Eat as many apples as possible!",
        instructions: "Use arrow keys to navigate",
        launch_command: 'snake_game'
    },
    { 
        name: "BATTLESHIP",
        description_formal: "A classic battleship game.",
        description_informal: "Sink the enemy!",
        instructions: "Follow game instructions",
        launch_command: 'battleship'
    },
    { 
        name: "CHESS",
        description_formal: "An all time classic chess game.",
        description_informal: "Kill the king !!!",
        instructions: "Follow game instructions",
        launch_command: 'terminal_chess'
    }]

    #prints main menu and reads answer
    def self.main_menu games_info
        #prints menu
        main_title = "WANT TO PLAY A GAME ???".green
        main_rows = []
        counter = 0
        games_info.each do | game |
            counter +=1
            row = ["#{counter}. ", game[:name].downcase.capitalize.cyan, game[:description_formal]]
            main_rows.push(row)
        end
        counter +=1
        exit_choice_row = ["#{counter}. ", "Exit".red, "Exit application"]
        main_rows.push(exit_choice_row)
        table = Terminal::Table.new title: main_title, rows: main_rows
        puts table
        #reads input
        max_option = games_info.length + 1
        print "Choose between 1-#{max_option}: "   
        answer = -1
        until answer > 0 && answer <= max_option
            answer = gets.chomp.to_i
            if answer > 0 && answer < max_option
                game_menu games_info[answer-1], games_info
            elsif answer == max_option
                puts "Exiting..."
                exit
            else
                puts "Choose between 1-#{max_option}"   
            end
        end
    end

    #prints a game menu for a specific game and reads answer
    def self.game_menu game_info, games_info
        #prints menu
        game_title = game_info[:name].green
        game_rows = []
        game_row_1 = [" - " + game_info[:description_informal]]
        game_row_2 = [" - " + game_info[:instructions]]
        game_row_3 = [" 1. " + "Launch".cyan]
        exit_choice_row = [" 2. " + "Return to main menu".red]
        game_rows.push(game_row_1, game_row_2, game_row_3, exit_choice_row)
        table = Terminal::Table.new title: game_title, rows: game_rows
        puts table
        #reads input
        print "Choose between 1-2: "  
        answer = -1
        until answer > 0 && answer <= 2
            answer = gets.chomp.to_i
            case answer
                when 1
                    system game_info[:launch_command]
                    main_menu games_info
                when 2
                    main_menu games_info
                else 
                    puts "Choose between 1-2"   
            end
        end
    end

end