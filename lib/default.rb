require 'date'

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::HTMLEscape
include Nanoc::Helpers::Rendering

class Fixnum
  def to_mon_s
    Date::MONTHNAMES[self]
  end

  def to_abbr_mon_s
    Date::ABBR_MONTHNAMES[self]
  end
end

class Numeric
  def ordinal
    if (10...20).include?(self) then
      self.to_s + 'th'
    else
      self.to_s + %w{th st nd rd th th th th th th}[self % 10]
    end
  end
end

def tags_for(item)
  item.fetch(:tags, '').split(/,| /).sort.map { |t| "<span class=tag>#{t}</span>" }.join('')
end

def date_for(item)
  match = item.identifier.to_s.match(%r{^/(\d{4})/(\d{2})-(\d{2})})
  year, month, day = *match[1..-1].map(&:to_i)
  "#{month.to_mon_s} #{day.ordinal}, #{year}"
end
