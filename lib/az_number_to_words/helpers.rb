module AzNumberToWords
  EXTENDED = {
    zero:        {value: 0,  translation: "sıfır"},
    one:         {value: 1,  translation: "bir"},
    two:         {value: 2,  translation: "iki"},
    three:       {value: 3,  translation: "üç"},
    four:        {value: 4,  translation: "dörd"},
    five:        {value: 5,  translation: "beş"},
    six:         {value: 6,  translation: "altı"},
    seven:       {value: 7,  translation: "yeddi"},
    eight:       {value: 8,  translation: "səkkiz"},
    nine:        {value: 9,  translation: "doqquz"},
    ten:         {value: 10, translation: "on"},
    twenty:      {value: 20, translation: "iyirmi"},
    thirty:      {value: 30, translation: "otuz"},
    fourty:      {value: 40, translation: "qırx"},
    fifty:       {value: 50, translation: "əlli"},
    sixty:       {value: 60, translation: "altmış"},
    seventy:     {value: 70, translation: "yetmiş"},
    eighty:      {value: 80, translation: "səksən"},
    ninety:      {value: 90, translation: "doxsan"},
    hundred:     {value: 100, translation: "yüz"},
    thousand:    {value: 1000, translation: "min"},
    million:     {value: 1_000_000, translation: "milyon"},
    billion:     {value: 1_000_000_000, translation: "milyard"}, 
    trillion:    {value: 1_000_000_000_000, translation: "trilyon"},
    quadrillion: {value: 1_000_000_000_000_000, translation: "kvadrilyon"},
    quintillion: {value: 1_000_000_000_000_000_000, translation: "kvintilyon"}
  }

  def translation_of n
    num = EXTENDED.find{|k, v| v[:value] == n }
    num.last[:translation] unless num.nil?
  end

  def literalize n
    raise NotImplementedError if n > 1000
    translation  = translation_of n
    return translation if translation
    if n < 100
      ones = n % 10
      tens = n - ones
      ones == 0 ? translation_of(tens) : "#{translation_of(tens)} #{translation_of(ones)}"
    elsif n < 200
      tens = n % 100
      tens == 0 ? translation_of(100) : "#{translation_of(100)} #{literalize(tens)}"
    elsif n < 1000
      hundreds, rest = n.divmod(100)
      "#{translation_of(hundreds)} #{literalize(100+rest)}"
    end 
  end

end