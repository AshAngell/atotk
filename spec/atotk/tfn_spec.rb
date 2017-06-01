require 'rspec'
require 'atotk'

describe 'TFN Numbers should validate correctly' do

  it 'should NOT validate 12345678' do
    tfn = AtoTk::Tfn.new 12345678
    expect(tfn.valid?).to be false
  end

  it 'should validate correctly for the test numbers' do
    [37118629, 37118660, 37118705, 38593474, 38593519].each do |number|
      tfn = AtoTk::Tfn.new number
      expect(tfn.valid?).to be true
    end
  end

  it 'should not validate string values' do
    tfn = AtoTk::Tfn.new 'abfertyui'
    expect(tfn.valid?).to be false
  end

  it 'should NOT validate numbers shorter than 8' do
    tfn = AtoTk::Tfn.new 1234567
    expect(tfn.valid?).to be false

  end

  it 'should NOT validate numbers longer than 8' do
    tfn = AtoTk::Tfn.new 123456789
    expect(tfn.valid?).to be false
  end

end