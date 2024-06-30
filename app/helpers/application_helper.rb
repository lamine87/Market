module ApplicationHelper
    def format_short_date(date)
        date.strftime("%d %B %Y")
    end
  end