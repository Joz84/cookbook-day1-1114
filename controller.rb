require_relative "view.rb"
require_relative "recipe.rb"

class Controller
    # Responsabilité: Demander aux autres
    def initialize(cookbook)
        @cookbook = cookbook
        @view = View.new
    end

    def list
        # Demander à cookbook la liste des recipes et la stocker dans une variable
        recipes = @cookbook.all
        # Demander à view de l'afficher à l'utilisateur
        @view.display(recipes)
    end

    def add
        # Demander à la vue de demander au user, le nom de la recette et le stocker dans une variable
        name = @view.ask("Name")
        # Demander à la vue de demander au user, la description de la recette et le stocker dans une variable
        description = @view.ask("Description")
        # Demander à Recipe de créer une recipe et la stocker dans une variable
        recipe = Recipe.new(name: name, description: description)
        # Demander à cookbook de l'ajouter à la liste
        @cookbook.create(recipe)
    end

    def remove
        # Demander à la vue de demander au user, l'index de la recette et le stocker dans une variable
        index = @view.ask_index
        # Demander à cookbook de le retirer de la liste
        @cookbook.destroy(index)
    end


end