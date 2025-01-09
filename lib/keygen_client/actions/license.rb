module Keygen
  module Actions
    module License
      def licenses
        parse_response self.class.get("/licenses", headers: @headers)
      end

      def license(id)
        parse_response self.class.get("/licenses/#{id}", headers: @headers)
      end

      # https://keygen.sh/docs/api/licenses/#licenses-create
      def license_create(options = {})
        parse_response self.class.post("/licenses", headers: @headers, body: { data: options }.to_json)
      end

      def license_update(id, options = {})
        parse_response self.class.put("/licenses/#{id}", headers: @headers, body: { license: options }.to_json)
      end

      def license_delete(id)
        parse_response self.class.delete("/licenses/#{id}", headers: @headers)
      end
    end
  end
end
