module Keygen
  module Actions
    module User
      def users
        parse_response self.class.get("/users", headers: @headers)
      end

      def user(id)
        parse_response self.class.get("/users/#{id}", headers: @headers)
      end
    end
  end
end
