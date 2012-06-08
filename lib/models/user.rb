module MyKissList
  module Records
    class User
      attr_accessor :id, :email, :password

      def initialize(attributes={})
        attributes ||= {}
        attributes.each_pair do |attr, value|
          setter = "#{attr}=".to_sym
          if self.respond_to?(setter)
            self.send setter, value
          end
        end
      end
    end
  end
end
