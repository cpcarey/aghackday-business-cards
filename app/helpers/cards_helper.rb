module CardsHelper
  
  def create_vcard(info)
    last_name = info.last_name
    first_name = info.first_name
    
    vcf = ""
    vcf += "BEGIN:VCARD\n"
    vcf += "VERSION:3.0\n"
    vcf += "N:" + last_name + ";" + first_name + ";;;\n"
    vcf += "FN:" + first_name + " " + last_name + "\n"
    vcf += "EMAIL;type=INTERNET;type=WORK;type=pref:" + info.email + "\n"
    vcf += "TEL;type=CELL;type=VOICE;type=pref:" + info.phone_number + "\n"
    vcf += "END:VCARD"
    vcf
  end
  
  # Derived from: http://mobicontact.info/iphone/download-contact-from-web-page/.
  def create_ics(info)
    vcard_base64 = Base64.encode64(create_vcard(info))
    vcard_base64 = vcard_base64.delete("\n")
    
    vcard_formatted = ""
    
    i = 0
    while i < vcard_base64.length - 74
      vcard_formatted += " " + vcard_base64[i...(i+74)] + "\n"
      i += 74
    end
    
    vcard_formatted += " " + vcard_base64[i...vcard_base64.length] + "\n"
    
    now = DateTime.now
    dt_start = now.strftime("%Y%m%dT%H%M00")
    dt_end = now.strftime("%Y%m%dT%H%M01")
    
    ics = ""
    ics += "BEGIN:VCALENDAR\n"
    ics += "VERSION:2.0\n"
    ics += "BEGIN:VEVENT\n"
    ics += "SUMMARY:Click attached contact below to save\n"
    ics += "DTSTART;TZID=Europe/London:" + dt_start + "\n"
    ics += "DTEND;TZID=Europe/London:" + dt_end + "\n"
    ics += "DTSTAMP:" + dt_start + "Z\n"
    ics += "ATTACH;VALUE=BINARY;ENCODING=BASE64;FMTTYPE=text/directory;\n"
    ics += " X-APPLE-FILENAME=contact.vcf:\n"
    ics += vcard_formatted
    ics += "END:VEVENT\n"
    ics += "END:VCALENDAR\n"

  end
end
