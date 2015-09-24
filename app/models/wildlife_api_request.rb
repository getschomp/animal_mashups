class WildlifeApiRequest

  attr_accessor :animal_class, :url_segment, :root

  def initialize(type = nil)
    @type = type
    @root = 'http://environment.ehp.qld.gov.au/'
    @animal_class = nil
  end

  def url_segment
    if @type == :animal_families
      return "species/?op=getfamilynames&kingdom=animals&class=#{@animal_class}"
    elsif @type == :animal_classes
      return 'species/?op=getclassnames&kingdom=animals&f=json'
    end
  end

  def response
    request = Typhoeus::Request.new(
      @root.to_s + url_segment.to_s,
      method: :get,
      body: @body,
      params: @params,
      headers: @header
    )
    request.run
  end

end
