class SkylarkService
	attr_reader :appid, :appsecret, :namespace_id, :host

	def initialize
    @namespace_id = 1
    @appid = 'f4f34a327fb4e2d5e87e5622f8ebb4cc45c7a8212650ebf2b95314f5170f0418'
    @appsecret = '7b99f2c7f85f148c57d9ed4cd1bdcd3d59a99a1666b0af6395f8fd1d22f2f001'
    @host = 'https://gxhz.cdht.gov.cn/'
  end

  def query_form_responses(form_id, page = 1, per_page = 24)
    RestClient::Request.execute(
      method: :get,
      url: query_form_responses_url(form_id, page, per_page),
      headers: authorization_token,
      timeout: 20
    )
  end
	private

  def query_form_responses_url(form_id, page, per_page)
  	"#{@host}/api/v4/mapper/responses?form_id=#{form_id}&page=#{page}&per_page=#{per_page}"
  end

	def authorization_token
    { Authorization: "#{@appid}:#{encode_secret}" }
  end

  def encode_secret
    JWT.encode(
      {
        'namespace_id': @namespace_id,
      },
      @appsecret,
      'HS256',
      typ: 'JWT', alg: 'HS256'
    )
  end

end