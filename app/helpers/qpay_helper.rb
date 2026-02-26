module QPayHelper
  def qpay_qr_code(qr_image, size: 256)
    return "" if qr_image.blank?
    content_tag(:div, class: "qpay-qr-code", style: "text-align:center;") do
      image_tag("data:image/png;base64,#{qr_image}", alt: "QPay QR Code", width: size, height: size)
    end
  end

  def qpay_payment_links(urls)
    return "" if urls.blank?
    content_tag(:div, style: "display:flex;flex-wrap:wrap;gap:8px;justify-content:center;") do
      safe_join(urls.map { |link|
        link_to(link[:link] || link["link"] || "#", target: "_blank",
          style: "display:inline-flex;align-items:center;gap:6px;padding:10px 16px;border:1px solid #ddd;border-radius:8px;text-decoration:none;color:#333;font-size:14px;") do
          logo = link[:logo] || link["logo"]
          name = link[:name] || link["name"] || "Pay"
          parts = []
          parts << image_tag(logo, width: 24, height: 24, alt: name) if logo.present?
          parts << name
          safe_join(parts)
        end
      })
    end
  end
end
