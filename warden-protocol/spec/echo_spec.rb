# coding: UTF-8

require "spec_helper"
require "warden/protocol/echo"

describe Warden::Protocol::EchoRequest do
  it_should_behave_like "wrappable request"

  subject do
    described_class.new(:message => "here's a snowman: ☃")
  end

  its(:type_camelized) { should == "Echo" }
  its(:type_underscored) { should == "echo" }

  field :message do
    it_should_be_required
    it_should_be_typed_as_string
  end

  it "should respond to #create_response" do
    subject.create_response.should be_a(Warden::Protocol::EchoResponse)
  end
end

describe Warden::Protocol::EchoResponse do
  it_should_behave_like "wrappable response"

  its(:type_camelized) { should == "Echo" }
  its(:type_underscored) { should == "echo" }

  it { should be_ok }
  it { should_not be_error }

  subject do
    described_class.new(:message => "here's a snowman: ☃")
  end

  field :message do
    it_should_be_required
    it_should_be_typed_as_string
  end
end
