class EventsParams
  def initialize raw_params, content_service_class: BetVictor::Content, parser_class: Parsers::JsonToRuby
    @raw_params            = raw_params
    @content_service_class = content_service_class
    @parser_class          = parser_class
  end

  def id
    raw_params.fetch :sport_id
  end

  def content
    content = content_service_class.new
    parser content.get
  end

  private

  def parser content
    parser = parser_class.new  content
    parser.call
  end

  attr_reader :raw_params, :content_service_class, :parser_class
end