require 'rspec'
require 'atotk'

describe 'ABN Numbers should validate correctly' do

  it 'should NOT validate 12345678' do
    abn = AtoTk::Abn.new 12345678
    expect(abn.valid?).to be false
  end

  it 'should validate correctly for the test numbers' do
    [84111122223, 98111133334, 23111144445, 37111155556, 41222277778].each do |number|
      abn = AtoTk::Abn.new number
      expect(abn.valid?).to be true
    end
  end

  it 'should not validate string values' do
    abn = AtoTk::Abn.new 'abfertyui'
    expect(abn.valid?).to be false
  end

  it 'should NOT validate numbers shorter than 11' do
    abn = AtoTk::Abn.new 1234567890
    expect(abn.valid?).to be false

  end

  it 'should NOT validate numbers longer than 11' do
    abn = AtoTk::Abn.new 123456789012
    expect(abn.valid?).to be false
  end

end