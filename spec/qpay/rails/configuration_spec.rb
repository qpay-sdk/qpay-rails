require "spec_helper"

RSpec.describe QPay::Rails::Configuration do
  describe "#initialize" do
    it "sets default base_url" do
      config = described_class.new
      expect(config.base_url).to eq("https://merchant.qpay.mn")
    end

    it "reads username from ENV" do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("QPAY_USERNAME").and_return("env_user")
      config = described_class.new
      expect(config.username).to eq("env_user")
    end

    it "reads password from ENV" do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("QPAY_PASSWORD").and_return("env_pass")
      config = described_class.new
      expect(config.password).to eq("env_pass")
    end

    it "reads invoice_code from ENV" do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("QPAY_INVOICE_CODE").and_return("INV_001")
      config = described_class.new
      expect(config.invoice_code).to eq("INV_001")
    end

    it "reads callback_url from ENV" do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("QPAY_CALLBACK_URL").and_return("https://example.com/cb")
      config = described_class.new
      expect(config.callback_url).to eq("https://example.com/cb")
    end

    it "reads base_url from ENV with fallback" do
      allow(ENV).to receive(:fetch).with("QPAY_BASE_URL", "https://merchant.qpay.mn").and_return("https://custom.qpay.mn")
      allow(ENV).to receive(:[]).and_call_original
      config = described_class.new
      expect(config.base_url).to eq("https://custom.qpay.mn")
    end

    it "returns nil for unset ENV variables" do
      allow(ENV).to receive(:[]).and_call_original
      allow(ENV).to receive(:[]).with("QPAY_USERNAME").and_return(nil)
      allow(ENV).to receive(:[]).with("QPAY_PASSWORD").and_return(nil)
      allow(ENV).to receive(:[]).with("QPAY_INVOICE_CODE").and_return(nil)
      allow(ENV).to receive(:[]).with("QPAY_CALLBACK_URL").and_return(nil)
      config = described_class.new
      expect(config.username).to be_nil
      expect(config.password).to be_nil
      expect(config.invoice_code).to be_nil
      expect(config.callback_url).to be_nil
    end
  end

  describe "attr_accessors" do
    it "allows setting base_url" do
      config = described_class.new
      config.base_url = "https://test.qpay.mn"
      expect(config.base_url).to eq("https://test.qpay.mn")
    end

    it "allows setting username" do
      config = described_class.new
      config.username = "test_user"
      expect(config.username).to eq("test_user")
    end

    it "allows setting password" do
      config = described_class.new
      config.password = "test_pass"
      expect(config.password).to eq("test_pass")
    end

    it "allows setting invoice_code" do
      config = described_class.new
      config.invoice_code = "INV_TEST"
      expect(config.invoice_code).to eq("INV_TEST")
    end

    it "allows setting callback_url" do
      config = described_class.new
      config.callback_url = "https://test.com/callback"
      expect(config.callback_url).to eq("https://test.com/callback")
    end
  end
end
