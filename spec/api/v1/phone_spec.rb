require 'rails_helper'

describe Api::V1::PhoneController do
  URL = 'http://localhost:3000/api/v1/phone/check'

  it 'should return 200 code for #check' do
    response = RestClient.post(URL,{phone: '123'})
    expect(response.code).to eq 200
  end

  it 'should return found => 1 when phone in stop list' do
    phone = '89199699926'
    Stoplist.create(phone: phone)
    response = RestClient.post(URL,{phone: phone})
    expect(JSON.parse(response.body)).to eq ({'found' => 1})
  end

  it 'should return found => 0 when phone not in stop list' do
    phone = '12345678'
    Stoplist.create(phone: phone)
    response = RestClient.post(URL,{phone: phone})
    expect(JSON.parse(response.body)).to eq ({'found' => 0})
  end

  it 'should return response as json' do
    phone = '12345678'
    Stoplist.create(phone: phone)
    response = RestClient.post(URL,{phone: phone})
    parse_res = JSON.parse(response)
    expect(parse_res['found']).to eq(0)

  end
end
