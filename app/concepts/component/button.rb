module Component
  class Button
    attr_accessor :url
    attr_accessor :label
    attr_accessor :http_method

    def initialize(url, label, method='get')
      self.url = url
      self.label = label
      self.http_method = method
    end

    def self.render(url, label, method='get')
      btn = Component::Button.new(url, label, method)
      Component::Cell::Button.(btn).()
    end
  end
end