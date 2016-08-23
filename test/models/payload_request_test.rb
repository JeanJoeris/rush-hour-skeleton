require_relative '../test_helper'

class PayloadRequestTable < Minitest::Test

  def payload
    payload = '{
  "url":"http://jumpstartlab.com/blog",
  "requested_at":"2013-02-16 21:38:28 -0700",
  "responded_in":37,
  "referred_by":"http://jumpstartlab.com",
  "request_type":"GET",
  "user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
  "resolution_width":"1920",
  "resolution_height":"1280",
  "ip":"63.29.38.211"
    }'
  end

  def parsed_payload
    JSON.parse(payload)
  end

  def test_parse_payload_request
    assert_equal 9, parsed_payload.keys.count
    assert_equal "http://jumpstartlab.com/blog", parsed_payload["url"]
  end

  def test_payload_request_object_has_attributes
    require "pry"; binding.pry
    db_payload = PayloadRequest.create(parsed_payload)

    assert_equal parsed_payload["url"], db_payload["url"]
    assert_equal parsed_payload["requestType"], db_payload["request_type"]
    assert_equal parsed_payload["ip"], db_payload["ip"]
  end
end
