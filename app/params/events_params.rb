class EventsParams
  def initialize raw_params, content_service_class: BetVictor::Content
    @raw_params            = raw_params
    @content_service_class = content_service_class
  end

  def id
    raw_params.fetch :sport_id
  end

  def content
    content = content_service_class.new
    content.get
  end

  private

  attr_reader :raw_params, :content_service_class
end