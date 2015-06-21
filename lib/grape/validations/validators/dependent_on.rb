module Grape
  module Validations
    class DependentOnValidator < Base
      def validate!(params)
        return if params[@option].blank?
        @required = true
        super
      end

      def validate_param!(attr_name, params)
        if params.respond_to?(:key?) && params.key?(attr_name)
          fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message_key: :presence
        end
      end
    end
  end
end
