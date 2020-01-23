require_relative '../lib/dark_trader'

describe 'the dark trader method' do
  html = open("https://coinmarketcap.com/all/views/all/")
  doc = Nokogiri::HTML(html)
  it 'should have no nil' do
    expect(names_nil?(doc)).to eq(false)
    expect(values_nil?(doc)).to eq(false)
  end
  it 'should have the names "Bitcoin" and "Ethereum"' do
    expect(finding_common_names?(doc)).to eq(true)
  end
end
