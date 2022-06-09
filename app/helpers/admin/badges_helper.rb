module Admin::BadgesHelper
  def badges_rules
    BadgesService::AVAILABLE_RULES.map(&:to_s)
  end
end
