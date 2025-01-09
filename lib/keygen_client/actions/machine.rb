module Keygen
  module Actions
    module Machine
      def machines
        parse_response self.class.get("/machines", headers: @headers)
      end

      def machine(id)
        parse_response self.class.get("/machines/#{id}", headers: @headers)
      end

      def machine_create(options = {})
        parse_response self.class.post("/machines", headers: @headers, body: { machine: options }.to_json)
      end

      def machine_update(id, options = {})
        parse_response self.class.put("/machines/#{id}", headers: @headers, body: { machine: options }.to_json)
      end

      def machine_delete(id)
        parse_response self.class.delete("/machines/#{id}", headers: @headers)
      end
    end
  end
end
