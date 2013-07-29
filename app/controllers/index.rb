get '/' do
  erb :index
end

post '/article' do
  url = params[:url]
  doc = Nokogiri::HTML(open(url))
  @h1 = doc.search('h1').inner_text
  @paragraphs = []
  if image_link = doc.at_css(".holder img")
    @image = image_link['src']
  end
  doc.search('p').each do |p|
    @paragraphs << p.inner_text
  end
  erb :article
end