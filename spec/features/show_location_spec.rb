require 'rails_helper'

feature 'show location' do
  scenario 'with valid data', js: true do
    geo = {type: 'Polygon', coordinates: [[
        [149.8183599114418,-32.36140331527542],
        [153.5537114739418,-31.84023266790935],
        [153.7294927239418,-34.66935854524544],
        [151.1806645989418,-35.13787911963418],
        [148.6318364739418,-33.97980872872456]
      ]]}
    area = RGeo::GeoJSON.decode(geo.to_json, json_parser: :json)
    loc = Location.create(name: 'test', area: area)
    visit location_path(loc)
    expect(evaluate_script('window.polygon.map.mapUrl')).to be_truthy
  end
end
