require "csv"

class Cookbook
    # Responsabilité: gestion de la liste
    def initialize(csv_file)
        @recipes = []
        @csv_file = csv_file
        parse_to_csv
    end

    def all
        @recipes
    end

    def create(recipe)
        @recipes << recipe
        store_in_csv
    end

    def destroy(recipe_index)
        @recipes.delete_at(recipe_index)
        store_in_csv
    end

    private

    def parse_to_csv
        CSV.foreach(@csv_file) do |row|
            recipe = Recipe.new(name: row[0], description: row[1])
            @recipes << recipe 
            # @recipes << Recipe.new(name: row[0], description: row[1])
        end
    end

    def store_in_csv
        CSV.open(@csv_file, "wb") do |csv|
            @recipes.each do |recipe|
                csv << [recipe.name, recipe.description]
            end
        end
    end
end