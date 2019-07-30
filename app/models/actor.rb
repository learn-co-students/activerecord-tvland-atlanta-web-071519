class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    # what if a character is in multiple shows? 
    def list_roles
        self.characters.map do |character|
            "#{character.name} - #{character.show.name}"
        end
    end

end