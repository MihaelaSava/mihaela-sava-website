# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  # items: array de hashes [{ name:, path:, policy: nil }, ...]
  # active_path: string (request.path)
  # current_user: utilizatorul curent (pentru verificări policy)
  # brand_name: textul din logo / home link
  def initialize(items:, active_path:, current_user: nil, brand_name: "Mihaela")
    @items = items
    @active_path = active_path
    @brand_name = brand_name
    @current_user = current_user
  end

  def visible_items
    @items.select { |item| item[:policy].nil? || item[:policy].call(@current_user) }
  end

  def active?(item_path)
    @active_path.chomp("/") == item_path.chomp("/")
  end
end
