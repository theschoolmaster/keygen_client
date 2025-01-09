module Keygen
  module Actions
    module Policy
      def policies
        parse_response self.class.get("/policies", headers: @headers)
      end

      def policy(id)
        parse_response self.class.get("/policies/#{id}", headers: @headers)
      end
    end
  end
end
