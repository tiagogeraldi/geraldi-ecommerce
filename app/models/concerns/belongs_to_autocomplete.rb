module BelongsToAutocomplete
  extend ActiveSupport::Concern

  module ClassMethods
    attr_reader :autocomplete_fields

    private

    def autocompleteable(opts={})
      opts.each do |obj, field|
        class_eval { attr_accessor "#{obj}_#{field}" }

        class_eval do
          send 'before_save', "set_#{obj}".to_sym
          send 'after_initialize', "set_#{obj}_#{field}".to_sym

          define_method "set_#{obj}" do
            eval "self.#{obj}_id = #{obj.capitalize.constantize.find_or_create_by(name: eval("#{obj}_#{field}")).id}"
          end

          define_method "set_#{obj}_#{field}" do
            send "#{obj}_#{field}=", eval("self.#{obj}.#{field}")
          end
        end
      end  
    end
  end
end