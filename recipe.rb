class Recipe
    attr_reader :name, :description

    def initialize(attrs)
        @name = attrs[:name]
        @description = attrs[:description]
    end
end