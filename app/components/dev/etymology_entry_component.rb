# app/components/dev/etymology_entry_component.rb
module Dev
  class EtymologyEntryComponent < ViewComponent::Base
    def initialize(
      term:,
      expansion:,
      category:,
      description:,
      example: nil,
      note: nil
    )
      @term = term
      @expansion = expansion
      @category = category
      @description = description
      @example = example
      @note = note
    end
  end
end
