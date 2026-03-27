module ApplicationHelper
  def language_options
    {
      en: { label: "English", flag: "🇬🇧" },
      ro: { label: "Română", flag: "🇷🇴" },
      fr: { label: "Français", flag: "🇫🇷" }
    }
  end
end
