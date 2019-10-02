module Serialize
    def self.write_to_file(serialized_string)
        Dir.mkdir("./saved_games") unless File.exist?("./saved_games")
        puts "name your save file"
        save_name = gets.chomp 
        File.open("./saved_games/#{save_name}",  "w") do |file|
            file.write(serialized_string)
        end
        puts "Successfully saved file"
        exit!
    end

    def self.select_file
        all_files = Dir.glob("./saved_games/*").each_with_index do |file_name, index|
            puts "#{index}) #{File.basename(file_name)}"
        end
        puts "Enter the number for the save file you want to load"
        reply = gets.chomp.to_i
       str = File.read(all_files[reply])
    end
end