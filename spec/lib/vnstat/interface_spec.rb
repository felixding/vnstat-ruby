describe Vnstat::Interface do
  let! :document do
    data = <<-XML
      <vnstat version="1.12" xmlversion="1">
        <interface id="eth0">
          <id>eth0-test</id>
          <nick>Ethernet</nick>
          <created><date><year>2015</year><month>10</month><day>21</day></date></created>
          <updated><date><year>2015</year><month>10</month><day>21</day></date><time><hour>22</hour><minute>58</minute></time></updated>
          <traffic>
            <total><rx>40732</rx><tx>7978</tx></total>
            <days>
              <day id="0"><date><year>2015</year><month>1</month><day>1</day></date><rx>1000</rx><tx>2000</tx></day>
              <day id="1"><date><year>2015</year><month>1</month><day>2</day></date><rx>3000</rx><tx>4000</tx></day>
            </days>
            <months>
              <month id="0"><date><year>2015</year><month>1</month></date><rx>1000</rx><tx>2000</tx></month>
              <month id="1"><date><year>2015</year><month>2</month></date><rx>3000</rx><tx>4000</tx></month>
            </months>
            <tops>
            </tops>
            <hours>
              <hour id="19"><date><year>2015</year><month>10</month><day>21</day></date><rx>6163</rx><tx>771</tx></hour>
              <hour id="20"><date><year>2015</year><month>10</month><day>21</day></date><rx>18367</rx><tx>3423</tx></hour>
            </hours>
          </traffic>
        </interface>
      </vnstat>
    XML
    Vnstat::Document.new(data)
  end

  subject { described_class.new(document, 'eth0') }

  describe '#id' do
    it 'returns id from the interface node' do
      expect(subject.id).to eq 'eth0'
    end
  end

  describe '#name' do
    it 'returns value from the nick node' do
      expect(subject.name).to eq 'Ethernet'
    end
  end

  describe '#created_on' do
    it 'returns the Date from the created node' do
      date = Date.new(2015, 10, 21)
      expect(subject.created_on).to eq date
    end
  end

  describe '#updated_at' do
    it 'returns the DateTime from the updated node' do
      datetime = DateTime.new(2015, 10, 21, 22, 58)
      expect(subject.updated_at).to eq datetime
    end
  end

  describe '#total' do
    it 'returns a Vnstat::Traffic' do
      expect(subject.total).to be_a Vnstat::Traffic
    end

    it 'calls Vnstat::Traffic.extract_from_xml_element' do
      expect(Vnstat::Traffic).to receive(:extract_from_xml_element).once

      subject.total
    end
  end

  describe '#hours' do
    it 'returns a Vnstat::Hours' do
      expect(subject.hours).to be_a Vnstat::Hours
    end
  end

  describe '#days' do
    it 'returns a Vnstat::Days' do
      expect(subject.days).to be_a Vnstat::Days
    end
  end

  describe '#months' do
    it 'returns a Vnstat::Months' do
      expect(subject.months).to be_a Vnstat::Months
    end
  end

  describe '#tops' do
    pending
  end
end
